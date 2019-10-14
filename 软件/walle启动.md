- 一键启动（快速体验）
```
docker-compose up -d && docker-compose logs -f
# 打开浏览器localhost:80
```

- 初始登录账号如下
```
超管：super@walle-web.io \ Walle123
所有者：owner@walle-web.io \ Walle123
负责人：master@walle-web.io \ Walle123
开发者：developer@walle-web.io \ Walle123
访客：reporter@walle-web.io \ Walle123
```

- 常用操作
```
# 构建服务
docker-compose build
# 启动服务,启动过程中可以直接查看终端日志，观察启动是否成功
docker-compose up
# 启动服务在后台，如果确认部署成功，则可以使用此命令，将应用跑在后台，作用类似 nohup python waller.py &
docker-compose up -d
# 查看日志,效果类似 tail -f waller.log
docker-compose logs -f
# 停止服务,会停止服务的运行，但是不会删除服务所所依附的网络，以及存储等
docker-compose stop
# 删除服务，并删除服务产生的网络，存储等，并且会关闭服务的守护
docker-compose down
```

[https://walle-web.io/docs/installation_docker.html](https://walle-web.io/docs/installation_docker.html)