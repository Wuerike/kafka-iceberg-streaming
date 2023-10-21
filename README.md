# Kafka Iceberg Streaming

This repo provides a demo of the [Apache Iceberg Sink Connector for Kafka Connect](https://github.com/tabular-io/iceberg-kafka-connect) you can execute locally with docker compose

It extends the [docker-spark-iceberg](https://github.com/tabular-io/docker-spark-iceberg) example, so you can also use this environment to test anything related to Iceberg

## Docker Compose Details

- redpanda: Just like Kafka but simpler to setup
- connect: Adds the Kafka Connect and the Iceberg Sink Connector settings
- console: Redpanda UI
- minio: Object storage compatible with Amazon S3
- aws: AWS CLI to create a Minio bucket
- spark-iceberg: Spark + Iceberg environment
- rest: Rest catalog to interact with Iceberg

### Redpanda

You can acces the Redpanda UI at http://localhost:18080, there's two main screens you should look at, `Topics` and `Connectors`

The `control-iceberg` topic it's used by the connector while `payments` is the one you going to publish the messages

![Alt text](/assets/topics.png)

You'll probabily want to wait until the IcebergSinkConnector be up and running before start publishing at the Topic, just like the image below

![Alt text](/assets/connector.png)

During the producer execution you can also monitor the screen to check if the connector got any error

### Minio

You can acces the Minio UI at http://localhost:9000, it will require an user and a password, both are set to `minioadmin`

The AWS CLI will create a bucket called `warehouse` during the docker compose execution, also a dataset and a table will be created by the spark-iceberg container

The script that creates both dataset and table can be found at `/spark/create_table.py`

### Spark-Iceberg

You can open the jupyter lab at http://localhost:8888/lab/tree/notebooks and use the sample notebook to query the table

Refer to [docker-spark-iceberg](https://github.com/tabular-io/docker-spark-iceberg) to check more details about it

## Benthos

[Benthos](https://www.benthos.dev/) it's declarative way of building stream processing and is used as the message producer in this example 

The `benthos.json.kafka.yaml` file describes the pipeline, it will consume from the file located at `data/*` and will publish to the `payments` Kafka topic

Installing:
```
curl -Lsf https://sh.benthos.dev | bash
```

Running:
```
benthos -c ./benthos.json.kafka.yaml
```

To make it simpler, you can also run with `make produce`
