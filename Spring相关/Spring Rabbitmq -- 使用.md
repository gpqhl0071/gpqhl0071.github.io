通过spring xml，配置rabbitmq消费者，参考：https://blog.csdn.net/Evankaka/article/details/50495437  


```
        <!--rabbitmq依赖 -->
        <dependency>
            <groupId>org.springframework.amqp</groupId>
            <artifactId>spring-rabbit</artifactId>
            <version>1.3.5.RELEASE</version>
        </dependency>
```
       
创建rabbitmq.xml，被spring容器上线文读取到
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:rabbit="http://www.springframework.org/schema/rabbit"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
     http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
     http://www.springframework.org/schema/beans
     http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
     http://www.springframework.org/schema/rabbit
     http://www.springframework.org/schema/rabbit/spring-rabbit-1.0.xsd">
    <!--配置connection-factory，指定连接rabbit server参数 -->
    <rabbit:connection-factory id="connectionFactory"
                               username="peng" password="123qwe" host="192.168.146.10" port="5672"/>

    <!--定义rabbit template用于数据的接收和发送 -->
    <rabbit:template id="amqpTemplate" connection-factory="connectionFactory"
                     exchange="exchangeTest"/>

    <!--通过指定下面的admin信息，当前producer中的exchange和queue会在rabbitmq服务器上自动生成 -->
    <rabbit:admin connection-factory="connectionFactory"/>

    <!--定义queue -->
    <rabbit:queue name="queueTest" durable="true" auto-delete="false" exclusive="false"/>

    <!-- 定义direct exchange，绑定queueTest -->
    <rabbit:direct-exchange name="exchangeTest" durable="true" auto-delete="false">
        <rabbit:bindings>
            <rabbit:binding queue="queueTest" key="queueTestKey"></rabbit:binding>
        </rabbit:bindings>
    </rabbit:direct-exchange>

    <!-- 消息接收者 -->
    <bean id="messageReceiver" class="com.redhorse.service.MessageConsumer"></bean>

    <!-- queue litener  观察 监听模式 当有消息到达时会通知监听在对应的队列上的监听对象-->
    <rabbit:listener-container connection-factory="connectionFactory">
        <rabbit:listener queues="queueTest" ref="messageReceiver"/>
    </rabbit:listener-container>

</beans>

```    

```java
package com.redhorse.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author gao peng
 * @date 2019/1/7 16:45
 */
@Service
public class MessageProducer {
  private Logger logger = LoggerFactory.getLogger(MessageProducer.class);

  @Resource
  private AmqpTemplate amqpTemplate;

  public void sendMessage(Object message) {
    logger.info("to send message:{}", message);
    amqpTemplate.convertAndSend("queueTestKey", message);
  }
}

```

```xml
package com.redhorse.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

/**
 * @author gao peng
 * @date 2019/1/7 16:46
 */
public class MessageConsumer implements MessageListener {
  private Logger logger = LoggerFactory.getLogger(MessageConsumer.class);

  @Override
  public void onMessage(Message message) {
    logger.info("receive message:{}", message);

  }
}

```