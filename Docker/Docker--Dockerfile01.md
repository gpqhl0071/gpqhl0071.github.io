- Dockerfile简单写法

```dockerfile
# this is a demo
FROM centos
MAINTAINER PENG

RUN yum install -y maven
CMD ["echo", "hello world"]
CMD ["mvn", "-version"]

```

- 构建Dockerfile
```dockerfile
docker build -t gpimage01:tag1 /gaopeng
```

- -t − is to mention a tag to the image
- ImageName − This is the name you want to give to your image.
- TagName − This is the tag you want to give to your image.
- Dir − The directory where the Docker File is present.
    
- 执行后结果
```shell
[root@localhost gaopeng]# docker build -t gpimage01:tag1 /gaopeng
Sending build context to Docker daemon    258MB
Step 1/5 : FROM centos
 ---> 0f3e07c0138f
Step 2/5 : MAINTAINER PENG
 ---> Using cache
 ---> 0e8c4defbc12
Step 3/5 : RUN yum install -y maven
 ---> Using cache
 ---> 9b509477d70a
Step 4/5 : CMD ["echo", "hello world"]
 ---> Running in 7b8a33ed6c14
Removing intermediate container 7b8a33ed6c14
 ---> 6b7f3857017a
Step 5/5 : CMD ["mvn", "-version"]
 ---> Running in 0ec575990d86
Removing intermediate container 0ec575990d86
 ---> 2685a791003f
Successfully built 2685a791003f
Successfully tagged gpimage01:tag1

```

- 运行容器
```shell
[root@localhost gaopeng]# docker run 2685a791003f
Apache Maven 3.5.4 (Red Hat 3.5.4-5)
Maven home: /usr/share/maven
Java version: 1.8.0_222, vendor: Oracle Corporation, runtime: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.el8_0.x86_64/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "3.10.0-957.21.3.el7.x86_64", arch: "amd64", family: "unix"
```