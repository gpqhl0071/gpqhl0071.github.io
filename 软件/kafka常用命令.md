- 启动  
sh kafka-server-start.sh -daemon ../config/server.properties
- 创建topic  
sh kafka-topics.sh --create --zookeeper localhost:2181 --topic first --partitions 2 --replication-factor 1

- 查看topic  
sh kafka-topics.sh --list --zookeeper localhost:2181

- 删除topic  
sh kafka-topics.sh --delete --zookeeper localhost:2181 --topic first
 
- 查看描述  
 sh kafka-topics.sh --describe --topic first --zookeeper localhost:2181