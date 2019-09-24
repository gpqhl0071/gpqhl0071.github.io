# 进制的简单介绍

对于数据的表示形式（也就是一种计数的方式），我们有常见的四种进制，分别是以下四种：  

- 二进制：0，1组成，满二进一
- 八进制：0~7组成，满八进一，以0开头
- 十进制：0~9组成，满十进一
- 十六进制：0~9和ABCDEF组成，满十六进一 ，以0x开头
  
  其中十进制就是我们日常使用的表达方式。  
  
# java声明不同进制的方法

```java
public class Demo {

  public static void main(String[] args) throws Exception {

    int a = 0b110;   //声明二进制变量
    int b = 011;    //声明八进制变量
    int c = 11;     //声明十进制变量
    int d = 0x95;   //声明十六进制变量
    System.out.println("a：" + a); //3
    System.out.println("b：" + b); //9
    System.out.println("c：" + c); //11
    System.out.println("d：" + d); //17

  }

}

```

二进制 （） 
 
1 = 00000001  
2 = 00000010  
3 = 00000011  

字节编码详解：https://blog.csdn.net/u012501054/article/details/53925214  



