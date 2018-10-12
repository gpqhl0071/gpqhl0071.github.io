
# github pages 自定义域名

## 准备工作  

- `cc.godaddy.com` 平台申请的域名  

- 已经拥有自己的github pages  


## 操作步骤  

- 看下自己的github对应的ip地址  

```aidl
ping gpqhl0071.github.io
```  

- 到如域名提供商网站进行DNS解析，下图红框内容修改  

![](http://ww1.sinaimg.cn/large/9b13c8fdgy1fw5g2ds7lsj21370jhwfr.jpg)

- 在github pages根目录下创建CNAME，内容为你自己的域名  

![](http://ww1.sinaimg.cn/large/9b13c8fdgy1fw5g3fp0csj208s036mx0.jpg)