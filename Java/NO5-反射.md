
# 反射的介绍

- 反射(Reflection) 是 Java 在运行时（Run time）可以访问、检测和修改它本身状态或行为的一种能力，它允许运行中的 Java 程序获取自身的信息，并且可以操作类或对象的内部属性。
- Class 类介绍：Java虚拟机为每个类型管理一个Class对象，包含了与类有关的信息，当通过 javac 编译Java类文件时，生成的同名 .class 文件保存着该类的 Class 对象，JVM 加载一个类即是加载该 .class 文件。
- Class 和 java.lang.reflect 一起对反射提供了支持
 
参考:https://laijianfeng.org/2018/12/Java%E5%8F%8D%E5%B0%84%E6%9C%BA%E5%88%B6%E8%AF%A6%E8%A7%A3/



# 下面这段代码，针对反射的应用有很大帮助： 

https://github.com/gpqhl0071/gpcode/blob/master/gputil/src/main/java/com/example/util/Invoke.java

