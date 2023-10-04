## How to Execute

1. Raise the containers by running `docker compose up`
2. Run `make config` to config schema registry and kafka connect
3. Open the SparkSQL terminal by running `docker exec -it spark-iceberg spark-sql`
4. Create the table at the SparkSQL terminal `CREATE TABLE default.events (id STRING,type STRING) PARTITIONED BY (type);`
5. Open the kafka ui `http://localhost:18080/ui/clusters/local/all-topics/events`
6. Click `Procuce Message` to and send messages to event topic, ex: `{"id":"1", "type":"2"}`
7. Check the connector at `http://localhost:18080/ui/clusters/local/connectors```