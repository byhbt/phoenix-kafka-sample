# Introduction

This is a sample Phoenix Application for demo connecting to Kafka. To see it in action, you can checkout the video here: https://youtu.be/Xwl0MKCnL_Y

## Features

- Setup local development environment using Docker Compose.
- [Kowl](https://github.com/cloudhut/kowl) explore Kafka messages.
- [Kaffe](https://github.com/spreedly/kaffe) Kafka client library for Phoenix projects.

## Up and running

Just run docker-compose up.

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
