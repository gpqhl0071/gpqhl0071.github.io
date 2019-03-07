# equals() and hashCode() methods in Java

1.**hashcode():**  
> You might know if you put entry in HashMap, first hashcode is calculated and this hashcode used to find bucket(index) where this entry will get stored in hashMap.You can read
 more at How hashMap works in java. What if you don’t override hashcode method, it will  return integer representation of memory address.


2.**equals():**  
> You have to override equals method, when you want to define equality between two object. If you don’t override this method, it will check for reference equality(==) i.e. if tow reference refers to same object or not

通常情况，要比较两个对象，要重写对象中的hashcode和equals方法。下面通过一个demo来看看为什么
- Country.java
```java
package org.arpit.java2blog;
 
public class Country {
 
    String name;
    long population;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public long getPopulation() {
        return population;
    }
    public void setPopulation(long population) {
        this.population = population;
    }
    
}
```

```java
package org.arpit.java2blog;
 
public class EqualityCheckMain {
 
    /**
     * @author arpit mandliya
     */
    public static void main(String[] args) {
        
        Country india1=new Country();
        india1.setName("India");
        Country india2=new Country();
        india2.setName("India");
        System.out.println("Is india1 is equal to india2:" +india1.equals(india2));
    }
 
}
```
输出结果
> Is india1 is equal to india2:false  

两个对象不相等

因为两个引用india1和india2都指向不同的对象，所以equals方法的默认实现为==，则equals方法返回false。在现实生活中，它应该是真实的，因为没有两个国家可以拥有相同的名称。

在Country类中增加
```java
@Override
public boolean equals(Object obj) {
    if (this == obj)
        return true;
    if (obj == null)
        return false;
    if (getClass() != obj.getClass())
        return false;
    Country other = (Country) obj;
    if (name == null) {
        if (other.name != null)
            return false;
    } else if (!name.equals(other.name))
        return false;
    return true;
}
```

再运行结果：Is india1 is equal to india2:true

---

下面我们将Country作为hashmap的key，来看下，设置相同的Country结果  

```java
package org.arpit.java2blog;
 
import java.util.HashMap;
import java.util.Iterator;
 
public class HashMapEqualityCheckMain {
 
    /**
     * @author Arpit Mandliya
     */
    public static void main(String[] args) {
        HashMap<Country,String> countryCapitalMap=new HashMap<Country,String>(); 
        Country india1=new Country();
        india1.setName("India");
        Country india2=new Country();
        india2.setName("India");
 
        countryCapitalMap.put(india1, "Delhi");
        countryCapitalMap.put(india2, "Delhi");
 
        Iterator countryCapitalIter=countryCapitalMap.keySet().iterator();
        while(countryCapitalIter.hasNext())
        {
            Country countryObj=countryCapitalIter.next();
            String capital=countryCapitalMap.get(countryObj);
            System.out.println("Capital of "+ countryObj.getName()+"----"+capital);
 
        }
    } 
}
```

输出结果：
```java
Capital of India----Delhi
Capital of India----Delhi
```

现在你必须想知道，即使两个对象相等，为什么HashMap包含两个键值对而不是一个。这是因为First HashMap使用hashcode来查找该键对象的存储桶，如果hashcode相同则只检查equals方法，因为上述两个国家/地区对象的哈希码使用默认的哈希码方法，两者将具有不同的内存地址，因此不同的哈希码。 
现在让我们覆盖hashcode方法。将以下方法添加到Country类  

```java
@Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }
```

输出结果
```java
Capital of India----Delhi
```

资源参考：https://java2blog.com/hashcode-and-equals-method-in-java/  