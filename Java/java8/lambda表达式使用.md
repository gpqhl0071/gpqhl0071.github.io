> lambda表达式在Java 8中添加，并提供以下功能。
- 允许将功能视为方法参数，或将代码视为数据。
- 可以在不属于任何类的情况下创建的函数。
- lambda表达式可以像传递对象一样传递，并按需执行。  

参考资料：https://www.geeksforgeeks.org/lambda-expressions-java-8/  

```java
// Java program to demonstrate lambda expressions 
// to implement a user defined functional interface. 
  
// A sample functional interface (An interface with 
// single abstract method 
interface FuncInterface 
{ 
    // An abstract function 
    void abstractFun(int x); 
  
    // A non-abstract (or default) function 
    default void normalFun() 
    { 
       System.out.println("Hello"); 
    } 
} 
  
class Test 
{ 
    public static void main(String args[]) 
    { 
        // lambda expression to implement above 
        // functional interface. This interface 
        // by default implements abstractFun() 
        FuncInterface fobj = (int x)->System.out.println(2*x); 
  
        // This calls above lambda expression and prints 10. 
        fobj.abstractFun(5); 
    } 
} 
```

`(int x)->System.out.println(2*x)`可以理解，这行代码是对接口`FuncInterface`方法`abstractFun`的实现。

用法: 
`lambda operator -> body`
