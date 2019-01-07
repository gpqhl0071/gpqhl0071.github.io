通过spring boot 搭建

# maven引入
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-amqp</artifactId>
</dependency>
```
# application.propertis配置
```
## 避免和 server 工程端口冲突
server.port=8011
spring.application.name=rabbitmq-hello

spring.rabbitmq.host=192.168.146.10
spring.rabbitmq.port=5672
spring.rabbitmq.username=peng
spring.rabbitmq.password=123qwe
```
# 服务端
```java
package com.example.demo.controller;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @author gao peng
 * @date 2019/1/7 15:52
 */
@RestController
@Component
public class Sender {
  @Autowired
  private AmqpTemplate rabbitTemplate;

  @RequestMapping(method = RequestMethod.GET, path = "/send")
  public void send() {
    String context = "hello " + new Date();
    System.out.println("Sender : " + context);
    this.rabbitTemplate.convertAndSend("hello", context);
  }
}

```

消费端
```java
package com.example.demo.controller;

import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author gao peng
 * @date 2019/1/7 15:53
 */
@Component
@RabbitListener(queues = "hello")
public class Receiver {
  @RabbitHandler
  public void process(String hello) {
    System.out.println("Receiver : " + hello);
  }
}

```