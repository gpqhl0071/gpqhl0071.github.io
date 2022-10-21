参考：[CentOS7安装KVM虚拟机详解](https://github.com/jaywcjlove/handbook/blob/master/CentOS/CentOS7%E5%AE%89%E8%A3%85KVM%E8%99%9A%E6%8B%9F%E6%9C%BA%E8%AF%A6%E8%A7%A3.md)

## 安装

```
virt-install \
--virt-type=kvm \
--name=centos01 \
--vcpus=2 \
--memory=4096 \
--location=/CentOS-7-x86_64-Minimal-2009.iso \
--disk path=/home/vms/centos01.qcow2,size=40,format=qcow2 \
--network bridge=virbr0 \
--graphics none \
--extra-args='console=ttyS0' \
--force
```


```$xslt
TYPE=Ethernet
BOOTPROTO=static
IPADDR=192.168.9.212
PREFIX=24
GATEWAY=192.168.9.11
DEFROUTE=yes
PEERDNS=yes
PEERROUTES=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_PEERDNS=yes
IPV6_PEERROUTES=yes
IPV6_FAILURE_FATAL=no
NAME=eth0
UUID=adfa3b7d-bf60-47e6-8482-871dee686fb5
DEVICE=eth0
ONBOOT=yes
```