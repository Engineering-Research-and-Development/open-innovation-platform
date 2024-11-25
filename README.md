<h1>Open Innovation Platform</h1>

<img src="./docs/images/Pioneer-Logo_Regular.png" alt="Pioneer Project logo" width="200px">

https://www.pioneer-project.eu/

<br>

Open Innovation Platform for optimising production systems by combining product development, virtual engineering workflows and production data.


![Open Innovation Platform Schema](./docs/images/OIP-Schema.png "Open Innovation Platform Schema")

<h2>Requirements</h2>
<ul>
    <li>Docker Engine</li>
    <li>Minimum 8GB RAM</li>
    <li>Docker Compose >= 2.27.1</li>
</ul>

<h2>How to run</h2>
<h3>Build & Run containers:</h3>

<code>docker compose up --build -d</code>

<br>

<h3>Access the UIs</h3>

1. Draco at https://localhost:8443/nifi
2. IotAgent UI at http://localhost:8087
3. Keycloak at http://localhost:8080
4. Grafana at http://localhost:3000
5. MinIO Console at http://localhost:9001

Default credentials for each UI are listed below:

<table>
<tr>
    <th>Application</th>
    <th>User</th>
    <th>Password</th>
</tr>
<tr>
    <td>Draco</td>
    <td>admin</td>
    <td>ctsBtRBKHRAx69EqUghvvgEvjnaLjFEB</td>
</tr>
<tr>
    <td>IotAgent UI</td>
    <td>admin</td>
    <td>admin</td>
</tr>
<tr>
    <td>Keycloak</td>
    <td>admin</td>
    <td>admin</td>
</tr>
<tr>
    <td>Grafana</td>
    <td>admin</td>
    <td>admin</td>
</tr>
<tr>
    <td>MinIO Console</td>
    <td>minioadmin</td>
    <td>minioadmin</td>
</tr>
</table>

<h2>Configuration</h2>
All the services into the OIP can be configured by editing files into the "conf" folder from the root of the project.

<h4>Draco</h4>
The component provides data flows based on Rest HTTP or MQTT.

In Draco you can configure your own data flow (see NiFi doc <a  href="https://nifi.apache.org/docs/nifi-docs/html/getting-started.html">here</a>), by accessing the UI.
Inside the template pre-loaded on Draco you can activate the flows you prefer to use and can configure each Draco processor following the notes on the UI.
Draco will start with pre-uploaded [OpenInnovationPlatform](conf/draco/templates/OpenInnovationPlatform.xml) template.

<h4>IotAgent UI</h4>
The component provide user-friendly interface to configure and handle IoT Agents.

<h4>Keycloak</h4>
The component provides Identity & Access Management functionalities.
Every role, user, client, etc. can be configured by the dedicated user interface.

The repository provides some pre-configured [clients](conf/keycloak/clients) that must be imported in Keycloak at the first startup.

<h4>Grafana</h4>
The component provides visualization functionalities and allows to build dashboards. It can be configured directly within the provided user interface.

<h4>MinIO Console</h4>
The component provides obejct storage functionalities.
It comes up with a pre-configured environment [file](conf/minio/minio.env).
