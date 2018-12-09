```
docker run -d -p 5000:5000 training/webapp python app.py
```

- 映射多个端口
```aidl
docker run -d -p 5000:5000 -p 3000:80 training/webapp python app.py
```

```aidl
docker run -d -p 192.168.48.140:4000:5000 training/webapp python app.py
```