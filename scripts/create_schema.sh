curl --request POST \
--url http://localhost:8085/subjects/events-value/versions \
--header 'Content-Type: application/json' \
--header 'User-Agent: insomnia/2023.5.8' \
--data '{ 
    "schema": "{\"type\":\"object\",\"properties\":{\"id\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"}},\"required\":[\"id\",\"type\"]}", 
    "schemaType": "JSON"
}'