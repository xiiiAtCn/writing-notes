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

#### 嵌套子查询

##### 成员资格测试
SQL允许测试元组在关系中的成员资格。连接词in测试元组是否是集合中的成员， 集合是由select子句产生的一组值构成的。连词not in则测试元组是否不是集合中的成员。

##### 集合的比较
```sql 示例
select name from instructor
where salary > some ( select salary from instructor where dept_name = 'Biology' )
```
SQL允许> some, <= some, >= some, = some和<>some. =some等价于in， 而<>some不等价于not in。any与some同义。  
SQL也支持将上面的some替换成all的形式。 <>all等价于not in， 但 =all并不等价于in
> <>some表示或关系， 而not in表示与关系

##### 空关系测试
SQL还有一个特性可测试一个子查询的结果中是否存在元组。exists结构在作为参数的子查询非空时返回true。可以用not exists结构测试子查询结果集中是否不存在元组。

##### 相关子查询
来自外层查询的一个相关名称可以用在where子句的子查询中。 使用了来自外层查询相关名称的子查询被称作相关子查询。

##### 重复元组存在性测试(未广泛实现)
SQL提供一个布尔函数， 用于测试在一个子查询的结果中是否存在重复元组。如果作为参数的子查询结果中没有重复的元组，unique结构将返回true

##### from子句中的子查询
SQL允许在from子句中使用子查询表达式。

##### with子句
with子句提供定义临时关系的方法，这个定义只对包含with子句的查询有效
```sql 示例
with max_budget(value) as 
    (
        select max(budget) from department
    )
select budget
from department, max_budget
where department.budget=max_budget.value
```
with子句使查询在逻辑上更加清晰， 它还允许在一个查询内的多个地方使用视图定义。

##### 标量子查询
SQL允许子查询出现返回单个值的表达式能够出现的任何地方，只要该子查询只返回包含单个属性的单个元组，这样的子查询称为标量子查询。



