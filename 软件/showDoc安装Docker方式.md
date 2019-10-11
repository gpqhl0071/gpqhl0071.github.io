官方文档：[https://www.showdoc.cc/help?page_id=65610](https://www.showdoc.cc/help?page_id=65610)

## 基础安装

```
# 原版官方镜像安装命令(中国大陆用户不建议直接使用原版镜像，可以用后面的加速镜像)
docker pull star7th/showdoc 

# 中国大陆镜像安装命令（安装后记得执行docker tag命令以进行重命名）
docker pull xd2idwf5.mirror.aliyuncs.com/star7th/showdoc
docker tag xd2idwf5.mirror.aliyuncs.com/star7th/showdoc:latest star7th/showdoc:latest 

##后续命令无论使用官方镜像还是加速镜像都需要执行
#新建存放showdoc数据的目录
mkdir /showdoc_data
mkdir /showdoc_data/html
chmod  -R 777 /showdoc_data

#启动showdoc容器
docker run -d --name showdoc -p 4999:80 -v /showdoc_data/html:/var/www/html/      star7th/showdoc
```