摘自：http://roufid.com/3-ways-to-add-local-jar-to-maven-project/


# 1- Install manually the JAR into your local Maven repository
第一个解决方案是使用Maven目标install：install-file手动将JAR添加到本地Maven存储库中。插件的使用非常简单，如下所示：  

> mvn install:install-file -Dfile=<path-to-file>

请注意，我们没有指定要安装的JAR的groupId，artifactId，版本和打包。实际上，从Maven-install-plugin的2.5版本开始，这些信息可以从任意指定的pomFile中获取。

这些信息也可以在命令行中给出：

> mvn install:install-file -Dfile=<path-to-file> -DgroupId=<group-id> -DartifactId=<artifact-id> -Dversion=<version>
 - `<path-to-file>: Path to the JAR to install`
 - `<group-id>: Group id of the JAR to install`
 - `<artifact-id>: Artifact id of the JAR to install`
 - `<version>:  Version of the JAR`
 
For example:  

> mvn install:install-file –Dfile=C:\dev\app.jar -DgroupId=com.roufid.tutorials -DartifactId=example-app -Dversion=1.0

然后，您可以通过将这些行添加到pom.xml文件中来将依赖项添加到Maven项目中：

```
<dependency>
	<groupId>com.roufid.tutorials</groupId>
	<artifactId>example-app</artifactId>
	<version>1.0</version>
</dependency>
```

该解决方案可能非常昂贵。为什么？您必须考虑在更改本地Maven存储库的那一天，您必须重新安装JAR。或者，如果有许多人在处理项目，则每个人都必须在其本地存储库中安装JAR。必须考虑项目的可移植性。

另一个解决方案是在你的pom.xml中使用maven-install-plugin，它将在Maven“初始化”阶段安装jar。为此，您必须指定要安装的jar的位置。最好的方法是将JAR放在项目根目录下创建的文件夹中（与pom.xml文件位于同一目录中）。

我们考虑jar位于<PROJECT_ROOT_FOLDER> /lib/app.jar下。下面是maven-install-plugin的配置：

```
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-install-plugin</artifactId>
    <version>2.5</version>
    <executions>
        <execution>
            <phase>initialize</phase>
            <goals>
                <goal>install-file</goal>
            </goals>
            <configuration>
                <groupId>com.roufid.tutorials</groupId>
                <artifactId>example-app</artifactId>
                <version>1.0</version>
                <packaging>jar</packaging>
                <file>${basedir}/lib/app.jar</file>
            </configuration>
        </execution>
    </executions>
</plugin>
```

> ${basedir} represents the directory containing pom.xml.

添加前面的行时可能会遇到错误，请将以下插件添加到项目中以允许生命周期映射：

```
<pluginManagement>
	<plugins>
		<!--This plugin's configuration is used to store Eclipse m2e settings only. 
			It has no influence on the Maven build itself. -->
		<plugin>
			<groupId>org.eclipse.m2e</groupId>
			<artifactId>lifecycle-mapping</artifactId>
			<version>1.0.0</version>
			<configuration>
				<lifecycleMappingMetadata>
					<pluginExecutions>
						<pluginExecution>
							<pluginExecutionFilter>
								<groupId>org.codehaus.mojo</groupId>
								<artifactId>aspectj-maven-plugin</artifactId>
								<versionRange>[1.0,)</versionRange>
								<goals>
									<goal>test-compile</goal>
									<goal>compile</goal>
								</goals>
							</pluginExecutionFilter>
							<action>
								<execute />
							</action>
						</pluginExecution>
						<pluginExecution>
							<pluginExecutionFilter>
								<groupId>
									org.apache.maven.plugins
								</groupId>
								<artifactId>
									maven-install-plugin
								</artifactId>
								<versionRange>
									[2.5,)
								</versionRange>
								<goals>
									<goal>install-file</goal>
								</goals>
							</pluginExecutionFilter>
							<action>
								<execute>
									<runOnIncremental>false</runOnIncremental>
								</execute>
							</action>
						</pluginExecution>
					</pluginExecutions>
				</lifecycleMappingMetadata>
			</configuration>
		</plugin>
	</plugins>
</pluginManagement>
```


# 2- Adding directly the dependency as system scope
另一个解决方案 - 脏解决方案 - 是通过添加依赖项作为系统范围并通过其完整路径引用它。考虑JAR位于<PROJECT_ROOT_FOLDER> / lib中。然后在pom.xml文件中添加依赖项，如下所示：

```
<dependency>
	<groupId>com.roufid.tutorials</groupId>
	<artifactId>example-app</artifactId>
	<version>1.0</version>
	<scope>system</scope>
	<systemPath>${basedir}/lib/yourJar.jar</systemPath>
</dependency>
```

# 3- Creating a different local Maven repository

第三个解决方案与第一个解决方案非常相似，不同之处在于JAR将安装在不同的本地Maven存储库中

让我们考虑新的本地Maven存储库名为“maven-repository”，位于$ {basedir}（包含pom.xml的目录）中。首先，您需要在新的本地maven存储库中部署本地JAR，如下所示：

> mvn deploy:deploy-file -Dfile=<path-to-file> -DgroupId=<group-id> -DartifactId=<artifact-id> -Dversion=<version> -Dpackaging=

通常，Maven deploy:deploy-file 将工件安装在远程存储库中，但在我们的情况下，存储库位于本地计算机中。

安装JAR后，需要在pom.xml文件中添加存储库：

```
<repositories>
    <repository>
        <id>maven-repository</id>
        <url>file:///${project.basedir}/maven-repository</url>
    </repository>
</repositories>
```

然后，您可以将依赖项添加到pom.xml中 

```
<dependency>
	<groupId>com.roufid.tutorials</groupId>
	<artifactId>example-app</artifactId>
	<version>1.0</version>
</dependency>
```

# 4- Using Nexus repository manager

最好的解决方案是使用Nexus Repository Manager，它将包含所有JAR，您将使用它作为存储库来下载依赖项。

