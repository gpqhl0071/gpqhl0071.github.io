sudo docker run --detach 
    --hostname 192.168.1.1 
    --publish 443:443 --publish 80:80
    --name gitlab 
    --restart always 
    --volume /srv/gitlab/config:/etc/gitlab 
    --volume /srv/gitlab/logs:/var/log/gitlab 
    --volume /srv/gitlab/data:/var/opt/gitlab 
    registry.docker-cn.com/gitlab/gitlab-ce