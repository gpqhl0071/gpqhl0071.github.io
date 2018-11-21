以ssh://git@gitlab.td.internal:20022/dx_shop/dx_shop_ui.git仓库为例  

想更新https://gitee.com/enation/ui.git的代码，合并到gitlab.td.internal:20022/dx_shop/dx_shop_ui.git仓库中  

- `git remote add demoa https://gitee.com/enation/ui.git`  
- `git fetch demoa`，弹出输入gitee账户用户、密码  
- 下图多了一个为demoa的仓库  
![](http://ww1.sinaimg.cn/large/9b13c8fdly1fxfg5zzeojj20s00fsmzo.jpg)
- `git branch -a`  
![](http://ww1.sinaimg.cn/large/9b13c8fdly1fxfg84pnaij20fv048weg.jpg)
- 执行`git merge remotes/demoa/master`  
![](http://ww1.sinaimg.cn/large/9b13c8fdly1fxfh5ke6i3j20go0cfmxt.jpg)

---
# 常用命令

参考：https://www.cnblogs.com/phpper/p/8391607.html  

//将online_a作为远程仓库，添加到online_b中，设置别名为online_a(自定义，这里我是为了方便区分仓库名)  

```aidl
git remote add online_a git@github.com:fantasy/online_a.git 
```

//从online_a仓库中抓取数据到本仓库,注意这里是上面设置的别名  

```aidl
git fetch online_a 
```

此时要合并的远端项目，被拉取到本地仓库`online_a`  

```aidl
git branch -a
```

```aidl
git merge "online_a项目"
```