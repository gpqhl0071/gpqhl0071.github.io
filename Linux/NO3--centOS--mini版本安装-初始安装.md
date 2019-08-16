# CentOS 7.0最小安装及配置
版本选择：
常见的有 Everything、Mininal、Live、NetInstall和DVD，这些版本的主要区别如下：

- Everything：对完整安装版的软件进行补充，集成了所有的软件，需要安装到计算机硬盘才能用，这个版本也是最完整的版本，一般也比较大；
- Minimal：迷你版，只带了基础的软件和系统安装必要的部分，需要其他软件用yum来安装；
- Live：分为DVD版和CD版，可以用于光盘启动到桌面，DVD版包含的软件比较多而已；
- NetInstall：网络安装版，安装包小，但是需要网络环境才能安装。

```
cd  /etc/sysconfig/network-scripts/  #进入网络配置文件目录
vi  ifcfg-ens33  #编辑配置文件
```
```aidl
TYPE=Ethernet
BOOTPROTO=static
NAME=ens33
ONBOOT=yes
DEFROUTE=yes
PEERDNS=yes
PEERROUTES=yes
IPADDR0=192.168.3.30
PREFIXO0=24
GATEWAY0=192.168.3.1
DNS1=114.114.114.114
```
```aidl
service network restart
```
`ping www.baidu.com`

## 修改主机名称： 

> 使用 echo $HOSTNAME 查询主机名称，然后通过修改 vi /etc/hostname 来修改主机名称，注意修改后需要注销重新登录之后才能生效


## 更新或升级最小安装的CentOS 

```aidl
# yum update && yum upgrade
```

## 关闭指定端口防火墙：

https://www.cnblogs.com/moxiaoan/p/5683743.html
```aidl
systemctl status firewalld  

#开启80端口

firewall-cmd --zone=public --add-port=80/tcp --permanent  

#开启3306端口

firewall-cmd --zone=public --add-port=3306/tcp --permanent  

#重启防火墙：

firewall-cmd --reload
```

## 安装ifconfig
```aidl
yum -y install net-tools
```
---
找不到基础命令
```
export PATH=/bin:/usr/bin:$PATH
```

参考：  
https://blog.csdn.net/linshuhe1/article/details/72900659

