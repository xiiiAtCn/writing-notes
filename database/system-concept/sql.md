---
title: SQL
date: 2018-4-6
categories: database
tags: [sql]
---

#### 概览
SQL语言有以下几部分:
* 数据定义语言(DDL): SQL DDL 提供了定义关系模式、删除关系以及修改关系模式的命令
* 数据操纵语言(DML): SQL DML提供从数据库中查询信息， 以及在数据库中插入元组、删除元组、修改元组的能力。
* 完整性(integrity): SQL DDL包括定义完整性约束的命令， 保存在数据库中的数据必须满足所定义的完整性约束。 破坏完整性约束的更新是不允许的。
* 视图定义(view definition): SQL DDL包括定义视图的命令
* 事务控制(transition control): SQL包括定义事务的开始和结束的命令。
* 嵌入式SQL和动态SQL(embedded SQL and dynamic SQL): 嵌入式和动态SQL定义SQL语句如何嵌入到通用编程语言。
* 授权(authorization): SQL DDL包括定义对关系和视图的访问权限的命令。

#### SQL查询的含义
1. 为from子句中列出的关系产生笛卡儿积
2. 在步骤1的结果上引用where子句中指定的谓词
3. 对于步骤2结果中的每个元组， 输出select子句中指定的属性(或表达式的结果)

#### 分组
需要保证出现在select语句中但没有被聚集的属性只能是出现在group by子句中的那些属性。

#### having子句
having子句中的谓词在形成分组后才起作用  
包含聚集、group by或having子句的查询的含义如下述操作:
1. 与不带聚集的查询情况类似， 最先根据from子句来计算出一个关系
2. 如果出现了where子句， where子句中的谓词将应用到from子句的结果关系上
3. 如果出现了group by子句， 满足where谓词的元组通过group by子句形成分组。 如果没有group by子句， 满足where谓词的整个元组被当作一个分组
4. 如果出现了having子句， 它将应用到每个分组上; 不满足having子句谓词的分组将被抛弃
5. select子句利用剩下的分组产生出查询结果中的分组， 即在每个分组上应用聚集函数来得到单个结果元组。

> 聚集函数中， 除了count(*)外所有的聚集函数都忽略输入集合中的空值。