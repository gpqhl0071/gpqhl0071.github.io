以下是设置下的顶级元素的概述 

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
      <localRepository/>
      <interactiveMode/>
      <offline/>
      <pluginGroups/>
      <servers/>
      <mirrors/>
      <proxies/>
      <profiles/>
      <activeProfiles/>
    </settings> 
``` 

可以使用以下表达式插入settings.xml的内容： 

1. ${user.home} and all other system properties (since Maven 3.0)
1. ${env.HOME} etc. for environment variables

# Settings Details

## Simple Values
```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  <localRepository>${user.home}/.m2/repository</localRepository>
  <interactiveMode>true</interactiveMode>
  <offline>false</offline>
  ...
</settings>
```
1. localRepository: 此值是此构建系统的本地存储库的路径。默认值为$ {user.home}
   /.m2 /
   repository。此元素对主构建服务器特别有用，允许所有登录用户从公共本地存储库构建。
2. interactiveMode: 
   如果Maven应该尝试与用户进行交互以进行输入，则为true，否则为false。默认为true。
3. offline: 
   如果此构建系统应在脱机模式下运行，则为true，默认为false。由于网络设置或安全原因，此元素对无法连接到远程存储库的构建服务器很有用。
   
   
   
## Plugin Groups

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  ...
  <pluginGroups>
    <pluginGroup>org.eclipse.jetty</pluginGroup>
  </pluginGroups>
  ...
</settings>
```
例如，给定上述设置，Maven命令行可以执行org.eclipse.jetty：jetty-maven-plugin：使用truncated命令运行

> mvn jetty:run

## Servers

用于下载和部署的存储库由POM的存储库和distributionManagement元素定义。但是，某些设置（如用​​户名和密码）不应与pom.xml一起分发。此类信息应存在于settings.xml中的构建服务器上。

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  ...
  <servers>
    <server>
      <id>server001</id>
      <username>my_login</username>
      <password>my_password</password>
      <privateKey>${user.home}/.ssh/id_dsa</privateKey>
      <passphrase>some_passphrase</passphrase>
      <filePermissions>664</filePermissions>
      <directoryPermissions>775</directoryPermissions>
      <configuration></configuration>
    </server>
  </servers>
  ...
</settings>
```

1. id: This is the ID of the server (not of the user to login as) that matches the id element of the repository/mirror that Maven tries to connect to.
1. username, password: These elements appear as a pair denoting the login and password required to authenticate to this server.
1. privateKey, passphrase: Like the previous two elements, this pair specifies a path to a private key (default is ${user.home}/.ssh/id_dsa) and a passphrase, if required. The passphrase and password elements may be externalized in the future, but for now they must be set plain-text in the settings.xml file.
1. filePermissions, directoryPermissions: When a repository file or directory is created on deployment, these are the permissions to use. The legal values of each is a three digit number corresponding to *nix file permissions, e.g. 664, or 775.


## Mirrors

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  ...
  <mirrors>
    <mirror>
      <id>planetmirror.com</id>
      <name>PlanetMirror Australia</name>
      <url>http://downloads.planetmirror.com/pub/maven2</url>
      <mirrorOf>central</mirrorOf>
    </mirror>
  </mirrors>
  ...
</settings>
```

1. id, name: 此镜像的唯一标识符和用户友好名称。
   id用于区分镜像元素，并在连接到镜像时从<servers>部分选择相应的凭据。
2. url: 此镜像的基本URL。构建系统将使用此URL连接到存储库而不是原始存储库URL。
1. mirrorOf: 这是一个镜像的存储库的id。例如，要指向Maven中央存储库（https://repo.maven.apache.org/maven2/）的镜像，请将此元素设置为central。更高级的映射，如repo1，repo2或*，！inhouse也是可能的。这必须与镜像ID不匹配。
  
## Proxies

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  ...
  <proxies>
    <proxy>
      <id>myproxy</id>
      <active>true</active>
      <protocol>http</protocol>
      <host>proxy.somewhere.com</host>
      <port>8080</port>
      <username>proxyuser</username>
      <password>somepassword</password>
      <nonProxyHosts>*.google.com|ibiblio.org</nonProxyHosts>
    </proxy>
  </proxies>
  ...
</settings>
```

1. id: 此代理的唯一标识符。 这用于区分代理元素。
1. active: 如果此代理是活动的，则为true。 这对于声明一组代理很有用，但一次只能有一个代理。
1. protocol, host, port: protocol：// host：代理的端口，分隔为离散元素。
1. username, password: 这些元素显示为一对，表示对此代理服务器进行身份验证所需的登录名和密码。
1. nonProxyHosts: 这是不应代理的主机列表。 列表的分隔符是代理服务器的预期类型; 上面的示例是管道分隔的 - 逗号分隔也很常见。


## Profiles
settings.xml中的profile元素是pom.xml profile元素的截断版本。它由激活，存储库，pluginRepositories和属性元素组成。概要文件元素仅包含这四个元素，因为它们关注整个构建系统（这是settings.xml文件的作用），而不是单个项目对象模型设置。

如果配置文件在设置中处于活动状态，则其值将覆盖POM或profiles.xml文件中任何等效的ID'd配置文件。  

### Activation

激活是配置文件的关键。与POM的配置文件一样，配置文件的强大功能来自于它仅在某些情况下修改某些值的能力。这些情况是通过激活元素指定的。

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  ...
  <profiles>
    <profile>
      <id>test</id>
      <activation>
        <activeByDefault>false</activeByDefault>
        <jdk>1.5</jdk>
        <os>
          <name>Windows XP</name>
          <family>Windows</family>
          <arch>x86</arch>
          <version>5.1.2600</version>
        </os>
        <property>
          <name>mavenVersion</name>
          <value>2.0.3</value>
        </property>
        <file>
          <exists>${basedir}/file2.properties</exists>
          <missing>${basedir}/file1.properties</missing>
        </file>
      </activation>
      ...
    </profile>
  </profiles>
  ...
</settings>
```



### Properties

### Repositories

存储库是Maven用于填充构建系统的本地存储库的项目的远程集合。它来自这个本地存储库，Maven称之为插件和依赖项。不同的远程存储库可能包含不同的项目，并且在活动的配置文件下，可以搜索它们以查找匹配的版本或快照工件。

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  ...
  <profiles>
    <profile>
      ...
      <repositories>
        <repository>
          <id>codehausSnapshots</id>
          <name>Codehaus Snapshots</name>
          <releases>
            <enabled>false</enabled>
            <updatePolicy>always</updatePolicy>
            <checksumPolicy>warn</checksumPolicy>
          </releases>
          <snapshots>
            <enabled>true</enabled>
            <updatePolicy>never</updatePolicy>
            <checksumPolicy>fail</checksumPolicy>
          </snapshots>
          <url>http://snapshots.maven.codehaus.org/maven2</url>
          <layout>default</layout>
        </repository>
      </repositories>
      <pluginRepositories>
        ...
      </pluginRepositories>
      ...
    </profile>
  </profiles>
  ...
</settings>
```

## Active Profiles

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      https://maven.apache.org/xsd/settings-1.0.0.xsd">
  ...
  <activeProfiles>
    <activeProfile>env-test</activeProfile>
  </activeProfiles>
</settings>
```

参考：https://maven.apache.org/settings.html

