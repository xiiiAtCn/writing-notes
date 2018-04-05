#### 安装mysql
1. 首先检查系统中是否已经安装了mysql
```bash
netstat -tap | grep mysql
```
2. 如果没有安装，则安装mysql
```bash
 apt-get install mysql-server mysql-client
```
3. 测试是否安装成功， 只需要执行第一条中的命令即可