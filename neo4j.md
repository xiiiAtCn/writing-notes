---
title: neo4j使用
date: 2018-4-9
categories: database
tags: [ Cypher, graph ]
---

#### 子句
1. match
2. return: 指定需要返回的节点, 关系或属性
3. where: 提供过滤匹配结果的标准
4. create & create unique: 创建节点和关系
5. merge: 确保提供的关系存在于图形中, 通过重用已经存在的节点和关系, 或者添加新的节点和关系
6. delete: 删除节点, 关系或属性
7. set: 设置属性的值
8. foreach: 对列表的每个元素执行更新操作
9. union: 合并来自多个查询的数据
10. with: 类似于Unix中的管道
11. start: 显式指定一个或多个开始节点(在match语句中不推荐使用)