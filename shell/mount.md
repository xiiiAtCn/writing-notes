mount命令默认会输出当前系统上挂载的设备列表. 要手动在虚拟目录中挂载目录:
```
mount -t type device directory
``` 
type参数指定了磁盘被格式化的文件系统类型  

#### 卸载设备
umount

#### 查看磁盘大小 df(disk space available on the file system)

#### 查看磁盘具体使用情况 du(disk used)

#### 数据排序 sort

#### 命令转进程
命令列表想要成为进程列表, 这些命令必须包含在括号里. 括号使命令列表变成了命令列表, 生成了一个子shell来执行对应的命令. 另一种命令分组是将命令放在花括号内, 并在列表尾部加上分号. 使用花括号进行命令分组并不会像进程列表那样创建子shell. 想要知道是否生成了子shell, 需要借助一个环境变量, BASH_SUBSHELL.

#### 协程
协程可以同时做两件事. 它在后台生成了一个子shell, 并在这个子shell中执行命令 coproc

#### 外部命令和内建命令
外部命令: 有时也称文件系统命令. 通常位于/bin、/usr/bin、/sbin或/usr/sbin中.外部命令执行时, 会创建出一个子进程. 这种操作被称为衍生(forking).