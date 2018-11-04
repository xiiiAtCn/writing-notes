---
title: Mysql必知必会
date: 2018-11-04 10:22
category: mysql
tags: [ database, fundamental ]
---
## 0x00
作为一个前端, 平时很少接触数据库. 虽然在平时觉得自己也会一点sql语句, 但当真的需要自己在数据库中创建用户, 授权和创建表结构时, 就有点不知所措了, 更不要说什么字符编码格式设置, 数据库备份了. 每次自己想要折腾点什么的时候, 总是会被这些开发前的基础操作卡住. 这次终于痛下决心, 将mysql使用中常用的一些命令做一个总结, 以便在之后再次碰到时可以有一个查询的地方, 不至于再在google上查的死去活来, 劳心又劳力. 好了, 正文开始.

## 0x01: mysql服务启动和停止
在linux上, 可以使用service命令来查看mysql服务的运行状态. 
```bash
service mysql status
```
如果mysql服务是开启状态的, 可以看到类似如下信息.
```
● mariadb.service - MariaDB database server
   Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
   Active: active (running) since Sun 2018-11-04 10:05:23 CST; 26min ago
  Process: 685 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
  Process: 682 ExecStartPost=/etc/mysql/debian-start (code=exited, status=0/SUCCESS)
  Process: 472 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= ||   VAR=`/usr/bin/galera_recovery`; [ $?
  Process: 438 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
  Process: 392 ExecStartPre=/usr/bin/install -m 755 -o mysql -g root -d /var/run/mysqld (code=exited, status=0/SUCCESS)
 Main PID: 583 (mysqld)
   Status: "Taking your SQL requests now..."
    Tasks: 27 (limit: 4915)
   CGroup: /system.slice/mariadb.service
           └─583 /usr/sbin/mysqld

Nov 04 10:05:21 iZ8vb19h08028cm32sq645Z systemd[1]: Starting MariaDB database server...
Nov 04 10:05:23 iZ8vb19h08028cm32sq645Z mysqld[583]: 2018-11-04 10:05:23 139923048784448 [Note] /usr/sbin/mysqld (mysqld 1
Nov 04 10:05:23 iZ8vb19h08028cm32sq645Z systemd[1]: Started MariaDB database server.
```
> 这里使用的mysql的一个衍生版: mariadb  

service命令的基本使用格式如下:
```
service < option > | --status-all | [ service_name [ command | --full-restart ] ]
```
除了staus命令, 还有start, stop, restart命令等, 如果想要查看service命令的更多用法, 需要使用man命令来查看详细说明.
```bash
man service
```
> 如果系统的版本比较老或者是非debian系的linux, 可能没有service命令, 这里有一个替代命令: systemctl,具体的使用方法可以[google](https://www.google.com/ncr)一下, 在这里就不过多介绍了.

## 0x02: 登录, 创建用户和授权

### 登录Mysql
一般在安装mysql后, 如果没有特殊设置, 一般只有一个root用户. 如果需要创建新的用户, 需要使用这个root用户登录mysql, 并执行相应的操作. 登录mysql的命令如下:
```
mysql -u root -p
```
回车后提示输入密码, 输入完成之后回车就登录进mysql了. 这里只是列出了登录本地Mysql需要的基本命令. 如果需要登录远程Mysql, 则需要通过Msql帮助获取更多的参数说明.
```
mysql --help
```
### 创建新用户
使用root用户登录Mysql后, 接下来就是创建新用户了. 下面就是一条最简单的创建命令.
```sql
CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'mypass';
```
这样就创建了一个能在本地登录, 密码是*mypass*的用户*jeffery*. 接下来就是给用户授权了.

### 授权
给用户授权, 则需要使用 _GRANT_ 关键字. 如给刚刚已经创建的*jeffery*授予数据库db1的*SELECT*权限, 则只需要如下操作.
```sql
    GRANT SELECT ON db1.* TO 'jeffery'@'localhost';
```
如果需要将*SELECT*权限扩大到全部数据库, 则只需要将*db1*换成\*. 如果需要授予所有权限, 则需要将*SELECT*换成*ALL*.

### 授权时创建用户
如果授权时, 该用户并未被创建, 则授权语句并不会报错, 而且, 会创建这个新用户, 并将权限赋予它. 所以, 一般情况下, 我们可以在同时进行用户的创建和授权. 那么就是下面的这种格式:
```sql
GRANT PRIVILEGES ON DATABASE.TABLE TO 'USERNAME'@'LOGINHOST' IDENTIFIED BY 'PASSWORD';
```
那么, 上面创建和授权的过程就可以简写为这样:
```sql
GRANT SELECT ON db1.* ON 'jeffery'@'localhost' IDENTIFIED BY 'mypass';
```
## 0x03: 数据库信息查看
1. 显示数据库列表:
```sql
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| resource           |
+--------------------+
4 rows in set (0.01 sec)

```
2. 进入某个数据库:
```sql
MariaDB [(none)]> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

```
3. 显示库中的数据表:
```sql
MariaDB [mysql]> show tables;
+---------------------------+
| Tables_in_mysql           |
+---------------------------+
| column_stats              |
| columns_priv              |
| db                        |
| event                     |
| func                      |
| general_log               |
| gtid_slave_pos            |
| help_category             |
| help_keyword              |
| help_relation             |
| help_topic                |
| host                      |
| index_stats               |
| innodb_index_stats        |
| innodb_table_stats        |
| plugin                    |
| proc                      |
| procs_priv                |
| proxies_priv              |
| roles_mapping             |
| servers                   |
| slow_log                  |
| table_stats               |
| tables_priv               |
| time_zone                 |
| time_zone_leap_second     |
| time_zone_name            |
| time_zone_transition      |
| time_zone_transition_type |
| user                      |
+---------------------------+
30 rows in set (0.00 sec)
```
4. 查看某个表的表结构:
```sql
MariaDB [mysql]> describe host;
+-----------------------+---------------+------+-----+---------+-------+
| Field                 | Type          | Null | Key | Default | Extra |
+-----------------------+---------------+------+-----+---------+-------+
| Host                  | char(60)      | NO   | PRI |         |       |
| Db                    | char(64)      | NO   | PRI |         |       |
| Select_priv           | enum('N','Y') | NO   |     | N       |       |
| Insert_priv           | enum('N','Y') | NO   |     | N       |       |
| Update_priv           | enum('N','Y') | NO   |     | N       |       |
| Delete_priv           | enum('N','Y') | NO   |     | N       |       |
| Create_priv           | enum('N','Y') | NO   |     | N       |       |
| Drop_priv             | enum('N','Y') | NO   |     | N       |       |
| Grant_priv            | enum('N','Y') | NO   |     | N       |       |
| References_priv       | enum('N','Y') | NO   |     | N       |       |
| Index_priv            | enum('N','Y') | NO   |     | N       |       |
| Alter_priv            | enum('N','Y') | NO   |     | N       |       |
| Create_tmp_table_priv | enum('N','Y') | NO   |     | N       |       |
| Lock_tables_priv      | enum('N','Y') | NO   |     | N       |       |
| Create_view_priv      | enum('N','Y') | NO   |     | N       |       |
| Show_view_priv        | enum('N','Y') | NO   |     | N       |       |
| Create_routine_priv   | enum('N','Y') | NO   |     | N       |       |
| Alter_routine_priv    | enum('N','Y') | NO   |     | N       |       |
| Execute_priv          | enum('N','Y') | NO   |     | N       |       |
| Trigger_priv          | enum('N','Y') | NO   |     | N       |       |
+-----------------------+---------------+------+-----+---------+-------+
20 rows in set (0.00 sec)

```

## 0x04: 数据库和表的创建与删除

1. 数据库的创建与删除
```sql
# 创建
create database databaseName;
# 删除
drop database databaseName;
```
2. 表的创建与删除  
表创建之前, 必须要先指定数据库, 否则是无法创建的. 删除同理.
```sql
#创建
create table tableName(create_definition,...)
    [table_options]
    [partition_options]
#删除
drop table tableName;
```
数据库的创建与删除相对来说, 比较简单, 但对于表来说, 因为涉及到每个字段的定义, 和对表的整体描述, 外加主键和外键关联等, 表的创建与删除更加复杂. 一般来说, 都会选择可视化工具来完成对表的创建和删除, 而不是手工去写sql语句, 这里只是对建表的语句的结构进行一个简要的介绍, 详细内容可以参见Mysql的帮助文档.

## 0x05: 系统工具的利用
这里忽略了如何对表及字段进行的一些操作, 不是不重要, 只是全部介绍清楚太过于繁琐, 即使看完了也只能是有个大致的印象, 等过个两天估计又忘了. 但是, 如果我们能够熟练的使用系统内的帮助, 即使记不住这些繁琐的结构, 也能很快的完成各种操作. 其中一个上面已经说过了, 就是系统内的*man*命令.
```
man mysql
MYSQL(1)                                        MariaDB Database System                                       MYSQL(1)

NAME
       mysql - the MariaDB command-line tool

SYNOPSIS
       mysql [options] db_name

DESCRIPTION
       mysql is a simple SQL shell (with GNU readline capabilities). It supports interactive and non-interactive use.
       When used interactively, query results are presented in an ASCII-table format. When used non-interactively (for
       example, as a filter), the result is presented in tab-separated format. The output format can be changed using
       command options.

...
```
这里对Mysql进行了详细的介绍. 不过由于没有目录结构, 可能会显得比较多. 但是, 还有一个更好用的帮助文档, 那就是Mysql终端里的*help*命令. 普通的*help*命令会显示一些常用的快捷命令.
```sql
MariaDB [(none)]> help

General information about MariaDB can be found at
http://mariadb.org

List of all MySQL commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear the current input statement.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
edit      (\e) Edit command with $EDITOR.
ego       (\G) Send command to mysql server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to mysql server.
help      (\h) Display this help.
nopager   (\n) Disable pager, print to stdout.
notee     (\t) Don't write into outfile.
pager     (\P) Set PAGER [to_pager]. Print the query results via PAGER.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.

For server side help, type 'help contents'

```
如果需要更加详细的帮助, 则需要*help contents*命令的帮助.
```sql
MariaDB [(none)]> help contents;
You asked for help about help category: "Contents"
For more information, type 'help <item>', where <item> is one of the following
categories:
   Account Management
   Administration
   Compound Statements
   Data Definition
   Data Manipulation
   Data Types
   Functions
   Functions and Modifiers for Use with GROUP BY
   Geographic Features
   Help Metadata
   Language Structure
   Plugins
   Procedures
   Table Maintenance
   Transactions
   User-Defined Functions
   Utility

```
在这里, 有更多细分的帮助说明. 在只有系统帮助的情况下, 就完成了以前需要在网上搜索很长时间才能完成的前期准备工作.

## 0x06: 后记
授之以鱼, 不如授之以渔, 真正学会了如何利用系统帮助, 才能真正的事半功倍. 优秀的软件本身就是最好的帮助文档,通过这次对*Mysql*基本操作的学习和总结, 更加深了我对这句话的理解.