参考：https://www.jianshu.com/p/540c0950cf5b

```aidl
keytool -genkey -alias tomcat -keyalg RSA -keystore //Users/penggao/soft/apache-tomcat-8.5.57/mykeystore/
```

```aidl
keytool -export -alias tomcat -keystore /Users/penggao/soft/apache-tomcat-8.5.57/mykeystore -file /Users/penggao/soft/apache-tomcat-8.5.57/mycerts.cer
```

```aidl
keytool -import -trustcacerts -alias tomcat -keystore "/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home/jre/lib/security/cacerts" -file /Users/penggao/soft/apache-tomcat-8.5.57/mycerts.cer
```

口令要输入:changeit


tomcat conf目录下，修改server.xml

```xml
      <Connector port="8443" protocol="org.apache.coyote.http11.Http11Protocol"
                maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
                clientAuth="false" sslProtocol="TLS" 
 	          keystoreFile="/Users/penggao/soft/apache-tomcat-8.5.57/mykeystore" keystorePass="123456"/>
```