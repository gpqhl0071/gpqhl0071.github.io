# 常用创建分支命令

```aidl
mvn -DskipTestProject=true gitflow:feature-start

mvn versions:set -DnewVersion=3.7.2-SNAPSHOT
```

# 打包上线操作


1. 分支开发完毕，合并分支代码到develop，执行命令：```mvn -DskipTestProject=true gitflow:feature-finish``` 

2. 代码合并没有问题，推送到远端git仓库 ``` git push ```

3. gitlib看develop分支pipline的CI的结果        
4. 确认代码都合并到develop，并且无误，
<br>gitflow分支模型，finish后会自动删除本地分支 ，删除分支推送到远端：```git push origin :feature/R2```
5. 基于develop创建release分支<br>创建release分支：```mvn gitflow:release-start``` <br>分支推送到远端 ```git push --set-upstream origin feature/3.2.0```  
6. release分支Push注意顺序，顺序不正确CI环节会出现异常<br> ```dx-service > dx-web-app > dx-web ``` 
7. gitlib看release分支pipline的CI结果    
8. jekins执行打包操作，产物生成到192.168.15.88服务器，开发先检查一下文件，没问题后杨兵操作  <br> 注意lib包 <br> 注意conf等配置文件
9. 上线成功，执行 ```mvn gitflow:release-finish ``` <br>release分支结束，代码会合并到develop、master、并生成tag，如v3.2.0<br>develop和master,push到远端仓库 <br>查看tag：```git tag``` 推送到远端：```git push --tags```    <br>
10. 确认代码都合并无误，同第四步
11. 完成

---