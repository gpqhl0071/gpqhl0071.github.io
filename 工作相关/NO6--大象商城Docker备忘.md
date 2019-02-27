```mysql
-- 服务目录
/opt/v70/api

-- 查看帮助
docker service logs --help

-- 查看服务
docker service ls | grep api

-- 查看实时日志
docker service logs -f api_buyer

-- 查看指定时间后的日志，只显示最后100行：
docker service logs -f -t --since="2019-02-27" --tail=100 api_manager

-- 查看最近30分钟的日志:
docker service logs --since 2m api_manager

-- 查看某时间段日志：
docker service logs -t --since="2019-02-27T10:23:37" --until="2019-02-27T12:23:37" api_manager
```