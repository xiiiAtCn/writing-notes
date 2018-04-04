---
title: 如何更好地使用hexo
date: 2018-1-22 20:01
categories: hexo
tag: tip
cover_picture: https://resource.lungern.site/picture/blog/hexo.png
---

#### 指定type为git时指定ssh的端口号
在hexo中, 如果使用git部署你生成的页面时, 会发现不需要指定ssh连接的端口号, 因为在hexo中, 它使用的是默认端口号. hexo官网给出的配置类似于下面这样的:
```
# Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: user@example.com:/blog.git
  branch: master
  message:
```
正常情况, 这是没有任何问题的. 但是如果你的博客是部署在vps上, 可能为了避免网络黑客暴力破解你的ssh密码, 会将ssh的监听端口改为其他值. 这时, 如果只是在冒号后面添加一个端口号, 会出现如下的错误提示:
```
ssh: connect to host example.com port 22: Connection timed out
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
FATAL Something's wrong. Maybe you can find the solution here: http://hexo.io/docs/troubleshooting.html
```
也就是说, 只是添加端口号, hexo并不会在创建ssh连接的时候, 将端口号指定为你所写的. 这时, 需要显式指定连接协议, 即在user前面添加ssh的协议名.
```
# Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: ssh://user@example.com:port/blog.git
  branch: master
  message:
```
如果其他地方没有问题的话, 就能够正常部署了.


#### 参考链接
1. [Specify Port For Hexo Git Deployment](http://searene.me/2015/12/17/Specify-Port-For-Hexo-Git-Deployment/)