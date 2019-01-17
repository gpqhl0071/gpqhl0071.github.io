# 测试环境service启动

```shell
./dx-public-service/work/bin/restart.sh
./dx-strategy-service/work/bin/restart.sh
./dx-activity-service/work/bin/restart.sh
./dx-assets-service/work/bin/restart.sh
./dx-user-service/work/bin/restart.sh 
```

# docker rabbitmq启动命令
```
docker run -d \
-p 192.168.15.31:5672:5672 \
-p 192.168.15.31:15672:15672 \
-p 192.168.15.31:4369:4369 \
-p 192.168.15.31:5671:5671 \
-p 192.168.15.31:15671:15671 \
-p 192.168.15.31:25672:25672 \
-p 192.168.15.31:61613:61613 \
-p 192.168.15.31:61614:61614 \
-p 192.168.15.31:1883:1883 \
-p 192.168.15.31:8883:8883 \
--name gprabbitmq5 rabbitmq:3-management
``` 
 4369, 25672, 5671, 5672, 15672, 61613, 61614, 1883, and 8883.

   ./dx-public-service/bin/start.sh
   ./dx-strategy-service/bin/start.sh
   ./dx-activity-service/bin/start.sh
   ./dx-assets-service/bin/start.sh
   ./dx-user-service/bin/start.sh 