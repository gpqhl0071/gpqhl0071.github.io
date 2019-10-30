
- 进入docker容器执行命令，可以设置环境变量，免密登录等操作

> docker exec -it epic_colden /bin/bash

退出使用  `exit`

- 查看日志

> docker logs -f -t --tail 200 f89d15c47bfd