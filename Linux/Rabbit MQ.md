```$xslt
wget http://www.rabbitmq.com/releases/erlang/erlang-19.0.4-1.el7.centos.x86_64.rpm

wget https://dl.bintray.com/rabbitmq/rabbitmq-server-rpm/rabbitmq-server-3.6.13-1.el7.noarch.rpm
```

```$xslt
rpm -ivh erlang-19.0.4-1.el7.centos.x86_64.rpm

yum install rabbitmq-server-3.6.13-1.el7.noarch.rpm
```

```
rabbitmq-plugins enable rabbitmq_management
```

```
rabbitmq-server --detached & ps aux | grep rabbitmq
```

参考：  
https://blog.csdn.net/Arvin_94/article/details/80981063  
https://segmentfault.com/a/1190000012690500   
http://chyufly.github.io/blog/2016/04/10/rabbitmq-setup/  


---
# 异常
>Job for rabbitmq-server.service failed because the control process exited with error code

https://stackoverflow.com/questions/25816918/not-able-to-start-rabbitmq-server-in-centos-7-using-systemctl
