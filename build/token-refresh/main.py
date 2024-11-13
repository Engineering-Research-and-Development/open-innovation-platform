import requests
import base64
import time
import os

# Configura l'endpoint di autenticazione, le credenziali e l'endpoint di Kong
AUTH_ENDPOINT = os.getenv('AUTH_ENDPOINT')
KONG_ADMIN = os.getenv('KONG_ADMIN')
ROUTE_NAME = os.getenv('ROUTE_NAME')
USERNAME = os.getenv('USERNAME')
PASSWORD = os.getenv('PASSWORD')

FIRST_TRY = True

def get_route_and_plugin_id(route_name):
    # Get from all routes, the one we are interested in
    print("Get from all routes, the one we are interested in", flush=True)
    route_url = f"{KONG_ADMIN}/routes"
    response = requests.get(route_url)
    if response.status_code == 200:
        routes = response.json().get("data", [])
        for route in routes:
            if route.get("name") == route_name:
                route_id = route.get("id")
                print(f"Route ID found: {route_id}", flush=True)

                # Find plugins associated to the route
                print("Find plugins associated to the route", flush=True)
                plugin_url = f"{KONG_ADMIN}/routes/{route_id}/plugins"
                plugin_response = requests.get(plugin_url)
                if plugin_response.status_code == 200:
                    plugins = plugin_response.json().get("data", [])
                    for plugin in plugins:
                        if plugin.get("name") == "request-transformer":
                            plugin_id = plugin.get("id")
                            print(f"Plugin ID found: {plugin_id}", flush=True)
                            return route_id, plugin_id
                else:
                    print("Cannot get plugin ID: ", plugin_response.text, flush=True)
                    return None, None
        print("No route found for the name specified", flush=True)
    else:
        print("Cannot get routes:", response.text, flush=True)
    return None, None

def get_new_token():
    auth_header = base64.b64encode(f"{USERNAME}:{PASSWORD}".encode()).decode()
    headers = {
        "Authorization": f"Basic {auth_header}",
        "Content-Type": "application/x-www-form-urlencoded"
    }

    data = {
        "grant_type": "client_credentials",
        "scope": "*:create *:read *:update *:delete *:invoke"
    }

    print("Retrieving token...", flush=True)
    response = requests.post(AUTH_ENDPOINT, headers=headers, data=data)
    if response.status_code == 200:
        token = response.json().get("access_token")
        print("Token:", flush=True)
        print(token, flush=True)
        return token
    else:
        print("Error on getting the token: ", response.text, flush=True)
        return None

def update_kong_token(route_id, plugin_id, token):
    global FIRST_TRY
    url = f"{KONG_ADMIN}/routes/{route_id}/plugins/{plugin_id}"
    print("Updating Kong request-transform plugin, calling ", url, flush=True)
    data = {"config.add.headers": f"Authorization:Bearer {token}"}
    response = requests.patch(url, data=data)
    if response.status_code == 200:
        FIRST_TRY = False
        print("Token updated on Kong.", flush=True)
    else:
        print("Error updating token on kong:", response.text, flush=True)

def main():
    global FIRST_TRY
    while True:
        try:
            route_id, plugin_id = get_route_and_plugin_id(ROUTE_NAME)
            if not route_id or not plugin_id:
                print("Cannot find Route and/or Plugin ID", flush=True)
                return

            token = get_new_token()
            if token:
                update_kong_token(route_id, plugin_id, token)
            else:
                print("Cannot get token, will try again...", flush=True)
        except:
            print("Cannot run routine, will try again...", flush=True)

        if FIRST_TRY:
            time.sleep(10)
        else:
            time.sleep(3600)


if __name__ == "__main__":
    main()
