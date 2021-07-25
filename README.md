# Phoenix Kafka

Sample Phoenix Application for demo connecting to Kafka.

## Features

- Setup local development environment using Docker Compose.
- Kowl for viewer Kafka.
- Kaffe Library for connecting to Kafka.

## Start

```bash
docker compose up
```

## Some useful command:

**Create topic**

```bash
docker compose exec kafka  \
kafka-topics --create --topic emails --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181
```

Or create multiple topics:

```bash
docker-compose exec kafka  \
  bash -c "seq 42 | kafka-console-producer --request-required-acks 1 --broker-list localhost:29092 --topic foo && echo 'Produced 42 messages.'"
```

**Describe topic**

```bash
docker compose exec kafka  \
  kafka-topics --describe --topic foo --zookeeper zookeeper:2181
```

## Video demo:
- https://youtu.be/Xwl0MKCnL_Y
