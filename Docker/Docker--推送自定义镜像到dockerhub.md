[https://www.tutorialspoint.com/docker/docker_public_repositories.htm](https://www.tutorialspoint.com/docker/docker_public_repositories.htm)


- 首先拥有dockerhub账号，并登陆[https://cloud.docker.com](https://cloud.docker.com)

- 创建response，如下图  

![1.png](http://ww1.sinaimg.cn/large/9b13c8fdgy1g7yoxhlo75j20ww08tgm2.jpg)

![2.png](http://ww1.sinaimg.cn/large/9b13c8fdgy1g7yoxbguuwj20ws09o0t4.jpg)

- 推送如下，本地镜像到dockerhub上
```shell
[root@localhost ~]# docker images
REPOSITORY                                     TAG                 IMAGE ID            CREATED             SIZE
gpimage01                                      tag1                2685a791003f        About an hour ago   510MB

```

- 修改成和dockerhub中response名称一致
```shell
[root@localhost ~]# docker tag 2685a791003f gpqhl0071/gp:1.0
```

```shell
[root@localhost ~]# docker images
REPOSITORY                                     TAG                 IMAGE ID            CREATED             SIZE
gpqhl0071/gp                                   1.0                 2685a791003f        About an hour ago   510MB
gpimage01                                      tag1                2685a791003f        About an hour ago   510MB

```

- 推送到dockerhub上
```shell
[root@localhost ~]# docker push gpqhl0071/gp:1.0
The push refers to repository [docker.io/gpqhl0071/gp]
f8dd8c155d75: Pushed 
9e607bb861a7: Pushed 
1.0: digest: sha256:a633657ac0108dd9ef55796f87ad1742c5639e4de72491ab0780b12a2919dc10 size: 742

```