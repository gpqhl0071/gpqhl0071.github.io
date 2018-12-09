```jshelllanguage
FROM nginx
RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
```

```jshelllanguage
docker build -t mynginx/nginx .
```

- -t ：指定要创建的目标镜像名

- . ：Dockerfile 文件所在目录，可以指定Dockerfile 的绝对路径