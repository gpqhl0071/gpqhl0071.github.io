# Kafka 常用命令

## 启动  

```shell
sh kafka-server-start.sh -daemon ../config/server.properties
```

##  创建topic  

```shell
sh kafka-topics.sh --create --zookeeper localhost:2181 --topic first --partitions 2 --replication-factor 1
```

## 查看topic  

```shell
sh kafka-topics.sh --list --zookeeper localhost:2181
```

## 删除topic  

```shell
sh kafka-topics.sh --delete --zookeeper localhost:2181 --topic first
```

## 查看描述  

```shell
sh kafka-topics.sh --describe --topic first --zookeeper localhost:2181
```

## 生成者命令

```shell
sh kafka-console-producer.sh --topic first --broker-list localhost:9092
```

## 消费者命令

```shell
sh kafka-console-consumer.sh --topic first --bootstrap-server localhost:9092
```

消费者可以设置偏移量，再有新的消费者，可选择行的选择接受消息的起始位置

```shell
sh kafka-console-consumer.sh --topic first --bootstrap-server localhost:9092 --from-beginning
```

