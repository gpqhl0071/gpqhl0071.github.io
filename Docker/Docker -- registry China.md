对于使用 systemd 的系统，请在 /etc/docker/daemon.json 中写入如下内容（如果文件不存在请新建该文件）  
```json
{
  "registry-mirrors": [
    "https://registry.docker-cn.com"
  ]
}
```

```jshelllanguagel
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```

重启后，使用`docker info`命令查看

参考：  
https://yeasy.gitbooks.io/docker_practice/install/mirror.html
