curl --request POST \
--url http://localhost:8083/connectors \
--header 'Content-Type: application/json' \
--header 'User-Agent: insomnia/2023.5.8' \
--data '{
    "name": "events-sink",
    "config": {
        "connector.class": "io.tabular.iceberg.connect.IcebergSinkConnector",
        "tasks.max": "1",
        "topics": "events",
        "iceberg.tables": "default.events",
        "iceberg.catalog.type": "rest",
        "iceberg.catalog.uri": "http://rest:8181",
        "iceberg.catalog.warehouse": "s3://warehouse/",
        "iceberg.catalog.io-impl":"org.apache.iceberg.aws.s3.S3FileIO",
        "iceberg.catalog.client.region":"us-east-1",
        "iceberg.catalog.s3.access-key-id":"admin",
        "iceberg.catalog.s3.secret-access-key":"password",
        "iceberg.catalog.s3.endpoint": "http://minio:9000",
        "key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "value.converter.schemas.enable": "false"
    }
}'