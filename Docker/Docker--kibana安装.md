- 启动  
```
docker run --name mykibana \
-v "/gaopeng/kibana/config":/usr/share/kibana/config \
-e elasticsearch=http://192.168.9.214:9200 \
-p 5601:5601 \
-d kibana:7.4.1
```