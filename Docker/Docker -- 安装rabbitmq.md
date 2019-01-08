参考：https://www.jianshu.com/p/14ffe0f3db94  

# 查找镜像
使用management版本，启动服务后，可以通过web页面进行访问
```jshelllanguage
docker search rabbitmq:management
```
# 获取镜像
```jshelllanguage
docker pull rabbitmq:management
```

# 运行镜像
```jshelllanguage
docker run -d -p 5672:5672 -p 15672:15672 --name rabbitmq rabbitmq:management
```
# 访问管理界面
访问管理界面的地址就是 http://[宿主机IP]:15672，可以使用默认的账户登录，用户名和密码都guest

如果仍然无法访问，则可以修改/etc/hosts，localhost解析的IP地址为本地内网IP