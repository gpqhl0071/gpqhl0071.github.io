- 在SNAPSHOT的情况下，Maven每天自动获取最新的SNAPSHOT，您可以强制maven使用-U开关下载最新的快照构建到任何maven命令。
```
mvn clean -U -Dmaven.test.skip=true package
```