<h1>OIP Tutorials</h1>

<h2>Orion To PostgreSQL</h2>
This section explains how to save data coming from Orion into the OIP PostgreSQL database.

<h4>Requirements</h4>
<ul>
    <li>OIP up & running</li>
</ul>

<h4>How it works</h4>
Draco is configured to listen at the port 8086 and base path /notify. All incoming Orion entities notifications are then stored 
into PostgreSQL depending on your needs.

<h4>How to configure</h4>
- Access Draco ui (https://localhost:8443/nifi)
- Double click on OrionToPostgres-PoC process group
- Double click on NGSIToPostgreSQL > Properties. Configure the processor depending on your needs
- Start the three processors in the group
- Perform a subscription to Orion. Here is an example:

```bash
curl --location 'http://localhost:1026/v2/subscriptions' \
--header 'Fiware-Service: service' \
--header 'Fiware-ServicePath: /servicepath' \
--header 'Content-Type: application/json' \
--data '{
  "description": "Car subscription1",
  "subject": {
    "entities": [
      {
        "id": "age01_Car",
        "type": "Device"
      }
    ],
    "condition": {
      "attrs": [
        "Engine_Oxigen",
        "Engine_Temperature"
      ]
    }
  },
  "notification": {
    "http": {
      "url": "http://draco:8086/notify"
    },
    "attrs": [
      "Engine_Oxigen",
      "Engine_Temperature"
    ]
  },
  "throttling": 1
}
'
```

- Update an attribute on Orion and check PostgreSQL database and table created
