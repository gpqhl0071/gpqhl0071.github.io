# MySQL server 启动（Ubuntu）

参考：https://www.linuxidc.com/Linux/2017-06/144805.htm

```aidl

sudo apt-get install mysql-server

sudo apt isntall mysql-client

sudo apt install libmysqlclient-dev

sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf

注释掉bind-address = 127.0.0.1：

grant all on *.* to root@'%' identified by '你的密码' with grant option;

flush privileges;

service mysql restart
```

