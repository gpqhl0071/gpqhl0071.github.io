通过gitlab import方式导入项目
```aidl
https://2058@forex.com.cn:Forex2018@gitee.com/enation/docker.git
```
---

参考：https://www.cnblogs.com/phpper/p/8391607.html  

```aidl
//将online_a作为远程仓库，添加到online_b中，设置别名为online_a(自定义，这里我是为了方便区分仓库名)
git remote add online_a git@github.com:fantasy/online_a.git 
```

```aidl
//从online_a仓库中抓取数据到本仓库,注意这里是上面设置的别名
git fetch online_a 
```

此时要合并的远端项目，被拉取到本地仓库`online_a`  

```aidl
git branch -a
```

```aidl
git merge "online_a项目"
```