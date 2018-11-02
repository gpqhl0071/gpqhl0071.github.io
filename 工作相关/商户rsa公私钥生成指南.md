# 商户rsa公私钥生成指南

- 使用openssl工具

- 生成私钥
```aidl
openssl genrsa -out private.pem 1024
```

- 把RSA私钥转换成PKCS8格式

```aidl
openssl pkcs8 -topk8 -inform PEM -in private.pem -outform PEM -nocrypt
```

复制-----BEGIN PRIVATE KEY----- 到 ----END PRIVATE
KEY-----的中间内容，去除回车，形成最终程序中用于加密的私钥，格式如下：（商户自己保存）

- 产生公钥

```aidl
openssl rsa -in private.pem -pubout -out public.pem
```
复制-----BEGIN PRIVATE KEY----- 到 ----END PRIVATE KEY-----的中间内容，去除回车，形成最终程序中用于解密的公钥