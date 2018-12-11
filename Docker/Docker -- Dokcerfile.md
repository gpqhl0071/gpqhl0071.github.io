> Dockerfile包含创建镜像所需要的全部指令。基于在Dockerfile中的指令，我们可以使用Docker build命令来创建镜像。通过减少镜像和容器的创建过程来简化部署。

指令不区分大小写。但是，命名约定为全部大写  

- MAINTAINER：设置该镜像的作者。语法如下：  
`MAINTAINER <author name>`

- RUN：在shell或者exec的环境下执行的命令。RUN指令会在新创建的镜像上添加新的层面，接下来提交的结果用在Dockerfile的下一条指令中。语法如下：
`RUN 《command》`

- ADD：复制文件指令。它有两个参数<source>和<destination>。destination是容器内的路径。source可以是URL或者是启动配置上下文中的一个文件。语法如下：
`ADD 《src》 《destination》`

- CMD：提供了容器默认的执行命令。 Dockerfile只允许使用一次CMD指令。 使用多个CMD会抵消之前所有的指令，只有最后一个指令生效。 CMD有三种形式：    
``` 
    CMD ["executable","param1","param2"]  
    CMD ["param1","param2"]  
    CMD command param1 param2 
```
    
- EXPOSE：指定容器在运行时监听的端口。语法如下：  
`EXPOSE <port>;`

- ENTRYPOINT：配置给容器一个可执行的命令，这意味着在每次使用镜像创建容器时一个特定的应用程序可以被设置为默认程序。同时也意味着该镜像每次被调用时仅能运行指定的应用。类似于CMD，Docker只允许一个ENTRYPOINT，多个ENTRYPOINT会抵消之前所有的指令，只执行最后的ENTRYPOINT指令。语法如下：  
```dockerfile
 ENTRYPOINT ["executable", "param1","param2"]
 ENTRYPOINT command param1 param2
```  

- WORKDIR：指定RUN、CMD与ENTRYPOINT命令的工作目录。语法如下：  
`WORKDIR /path/to/workdir`  

- ENV：设置环境变量。它们使用键值对，增加运行程序的灵活性。语法如下：  
`ENV <key> <value>`

- USER：镜像正在运行时设置一个UID。语法如下：
`USER <uid>` 

- VOLUME：授权访问从容器内到主机上的目录。语法如下：  
`VOLUME ["/data"]`

---

## 了解构建上下文（Understand build context）

如何理解dockerfile构建上线文，运行完例子1和例子2就明白了。  

- 例子1
```dockerfile
mkdir myproject && cd myproject
echo "hello" > hello
echo -e "FROM busybox\nCOPY /hello /\nRUN cat /hello" > Dockerfile
docker build -t helloapp:v1 .
```
输出以下内容：  
```dockerfile
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM busybox
 ---> 59788edf1f3e
Step 2/3 : COPY /hello /
 ---> Using cache
 ---> eeab13116aad
Step 3/3 : RUN cat /hello
 ---> Using cache
 ---> cd42fb117ffe
Successfully built cd42fb117ffe
Successfully tagged helloapp:v1

```

- 例子2
```dockerfile
mkdir -p dockerfiles context
mv Dockerfile dockerfiles && mv hello context
docker build --no-cache -t helloapp:v2 -f dockerfiles/Dockerfile context
```

## Pipe Dockerfile through `stdin`

17.05以上的版本  

```dockerfile
docker build -t foo . -f-<<EOF
FROM busybox
RUN echo "hello world"
COPY . /my-copied-files
EOF
```

Docker 17.05 and higher (remote build-context) 远程构建  

```dockerfile
docker build -t foo https://github.com/thajeztah/pgadmin4-docker.git -f-<<EOF
FROM busybox
COPY LICENSE config_local.py /usr/local/lib/python2.7/site-packages/pgadmin4/
EOF
```

参考：https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#pipe-dockerfile-through-stdin  




