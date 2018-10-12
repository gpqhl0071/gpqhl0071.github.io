# 测试环境启动命令

- 192.168.15.31
- /usr/local/redis/redis-4.0.11
- 需要切换到root用户操作

## 主从启动
- ./src/redis-server redisMaster.conf 
- ./src/redis-server redisSlave1.conf 
- ./src/redis-server redisSlave2.conf 

## 启动哨兵
- ./src/redis-sentinel sentinel.conf 
- ./src/redis-sentinel sentinel26380.conf 
- ./src/reis-sentinel sentinel26381.conf

## 配置
### redis.conf
```$xslt
bind 192.168.15.31
protected-mode yes
port 6379
tcp-backlog 511
timeout 0
tcp-keepalive 300
daemonize yes
supervised no
pidfile /var/run/redis_6379.pid
loglevel notice
logfile ""
databases 16
always-show-logo yes
save 900 1
save 300 10
save 60 10000
stop-writes-on-bgsave-error yes
rdbcompression yes
rdbchecksum yes
dbfilename dump.rdb
dir ./
slave-serve-stale-data yes
slave-read-only yes
repl-diskless-sync no
repl-diskless-sync-delay 5
repl-disable-tcp-nodelay no
slave-priority 100
requirepass forex0028
lazyfree-lazy-eviction no
lazyfree-lazy-expire no
lazyfree-lazy-server-del no
slave-lazy-flush no
appendonly no
appendfilename "appendonly.aof"
appendfsync everysec
no-appendfsync-on-rewrite no
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
aof-load-truncated yes
aof-use-rdb-preamble no
lua-time-limit 5000
slowlog-log-slower-than 10000
slowlog-max-len 128
latency-monitor-threshold 0
notify-keyspace-events ""
hash-max-ziplist-entries 512
hash-max-ziplist-value 64
list-max-ziplist-size -2
list-compress-depth 0
set-max-intset-entries 512
zset-max-ziplist-entries 128
zset-max-ziplist-value 64
hll-sparse-max-bytes 3000
activerehashing yes
client-output-buffer-limit normal 0 0 0
client-output-buffer-limit slave 256mb 64mb 60
client-output-buffer-limit pubsub 32mb 8mb 60
hz 10
aof-rewrite-incremental-fsync yes
```

### sentinel.conf配置
```$xslt
bind 192.168.15.31
port 26379
dir "/tmp"
sentinel myid c3989e911e6d965d5b9bd86d741d58fc29cd56c3
sentinel deny-scripts-reconfig yes
sentinel monitor mymaster 192.168.15.31 6379 2
sentinel auth-pass mymaster forex0028
sentinel config-epoch mymaster 0
daemonize yes
sentinel leader-epoch mymaster 0
sentinel known-slave mymaster 192.168.15.31 6381
sentinel known-slave mymaster 192.168.15.221 6381
sentinel known-slave mymaster 192.168.15.31 6380
sentinel known-slave mymaster 192.168.15.221 6380
sentinel known-sentinel mymaster 192.168.15.31 26380 e2ffc3b0e4cb64808f5c27afa130eb699e5ab9e1
sentinel known-sentinel mymaster 192.168.15.31 26381 de2225e574ddd2c260ed434b693ca7b56f7464c8
sentinel current-epoch 0

```
