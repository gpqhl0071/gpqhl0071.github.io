## 分支管理
### 创建分支命令

---

当前代码的分支切换到develop，执行如下命令创建feature分支  
  
```mvn -DskipTestProject=true gitflow:feature-start```  

批量更新版本号，根据当前协定的需求版本，进行修改  
  
```mvn versions:set -DnewVersion=3.7.2-SNAPSHOT```

### 结束feature分支操作

1. 分支开发完毕，合并分支代码到develop，执行命令：  
```mvn -DskipTestProject=true gitflow:feature-finish``` 

2. 代码合并没有问题，推送到远端git仓库  
 ``` git push ```

3. gitlib看develop分支pipline的CI的结果        

4. 确认代码都合并到develop，并且无误，
<br>gitflow分支模型，finish后会自动删除本地分支 ，删除分支推送到远端：   
 ```git push origin :feature/R2```

### 创建release分支操作

5. 基于develop创建release分支 ：  
```mvn -DskipTestProject=true gitflow:release-start```   

1. 注意dx-web 及 dx-web-app的POM中，dx-common的版本号，gitflow不会自动修改，需要手动修改，去掉shapshot.

1. 检查版本号无误。

1. 分支推送到远端  
 ```git push --set-upstream origin feature/3.2.0```    
 
6. release分支Push注意顺序，顺序不正确CI环节会出现异常  
```dx-service > dx-web-app > dx-web ``` 
7. gitlib看release分支pipline的CI结果    

8. jekins执行打包操作，产物生成到192.168.15.88服务器，开发先检查一下文件，没问题后运维操作  <br> 注意lib包 <br> 注意conf等配置文件

### 上线成功后，结束release分支操作

9. 上线成功，执行   
```mvn -DskipTestProject=true gitflow:release-finish ```  
9. release分支结束，代码会合并到develop、master、并生成tag，如v3.2.0   
 
9. develop和master,push到远端仓库  git push develop 、 git push master  

9. 查看tag：```git tag``` 推送到远端：```git push --tags```   
 
9. 删除远端release分支，`git push origin :release/R2`   


