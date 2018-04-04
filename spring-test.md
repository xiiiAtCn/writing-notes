---
title: springboot中的测试
date: 2018-2-2 17:33
categories: Java
tags: test
---
springboot中支持测试的模块有两个: spring-boot-test和spring-boot-test-autoconfigure, 前者包含核心模块,后者为测试提供自动配置支持  
spring-boot-starter-tester中, 包含了以下几个测试库: 
1. [JUnit](http://junit.org/junit5/) 👉 [github](https://github.com/junit-team/junit5)
2. [Spring Test & Spring Boot Test](https://docs.spring.io/spring/docs/4.3.14.RELEASE/spring-framework-reference/htmlsingle/#integration-testing)
3. [AssertJ](https://joel-costigliola.github.io/assertj/) 👉 [github](https://github.com/joel-costigliola/assertj-core)
4. [Hamcrest](http://hamcrest.org/JavaHamcrest/) 👉 [github](https://github.com/hamcrest/JavaHamcrest)
5. [Mockito](http://site.mockito.org/) 👉 [github](https://github.com/mockito/mockito)
6. [JSONAssert](http://jsonassert.skyscreamer.org/) 👉 [github](https://github.com/skyscreamer/JSONassert)
7. [JsonPath](http://goessner.net/articles/JsonPath/) 👉 [github](https://github.com/json-path/JsonPath) 


##### @SpringBootTest注解
当需要springboot中的特性时,可以使用@SpringBootTest, 来替代spring-test中的标准注解@ContextConfiguration