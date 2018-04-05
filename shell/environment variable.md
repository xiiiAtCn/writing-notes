#### shell环境变量

#### 全局环境变量
1. 查看
```
printenv
或
env
```

#### 局部环境变量
创建全局环境变量的方法是先创建一个局部环境变量, 然后再把它导出到全局环境中. 这个过程通过export命令来完成, 变量名前面不需要加$.  
删除环境变量使用unset命令.

#### 默认的shell环境变量
1. bash支持的Bourne变量 

|变量|描述|
|CDPATH|冒号分隔的目录列表, 作为cd命令的搜索路径|
|HOME|当前用户的主目录|
|IFS|shell用来将文本字符串分割成字段的一系列字符|
|MAIL|当前用户收件箱的文件名(bash shell会检查这个文件, 看看有没有新邮件)|
|MAILPATH|冒号分隔的当前用户收件箱的文件名列表(bash shell会检查列表中的每个文件, 看看有没有新邮件)|
|OPTARG|getopts命令处理的最后一个选项参数值|
|OPTIND|getopts命令处理的最后一个选项参数的索引号|
|PATH|shell查找命令的目录列表, 由冒号分隔|
|PS1|shell命令行界面的主提示符|
|PS2|shell命令行界面次提示符|

2. bash自有变量

|变量|描述|
|---|---|
|BASH|当前shell实例的全路径名|
|BASH_ALIASES|含有当前已设置别名的关联数组|
|BASH_ARGC|含有传入子函数或shell脚本的参数总数的数组变量|
|BASH_ARCV|含有传入子函数或shell脚本的参数的数组变量|
|BASH_CMDS|关联数组, 包含shell执行过的命令的所在位置|
|BASH_COMMAND|shell正在执行的命令或马上就执行的命令|
|BASH_ENV|设置了的话, 每个bash脚本就会在运行前先尝试运行该变量定义的启动文件|
|BASH_EXECUTION_STRING|使用bash -c选项传递过来的命令|
|BASH_LINENO|含有当前执行的shell函数的源代码行号的数组变量|
|BASH_REMATCH|只读数组, 在使用正则表达式的比较运算符=~进行肯定匹配时, 包含了匹配到的模式和子模式|
|BASH_SOURCE|含有当前正在执行的shell函数所在源文件名的数组变量|
|BASH_SUBSHELL|当前子shell环境的嵌套级别(初始值是0)|
|BASH_VERSINFO|含有当前运行的bash shell的主版本号和次版本号的数组变量|
|BASH_VERSION|当前运行的bash shell的版本号|
|BASH_XTRACEFD|若设置成了有效的文件描述符(0, 1, 2), 则'set -x'调试选项生成的跟踪输出可被重定向. 通常用来将跟踪输出到一个文件中|
|BASHOPTS|当前启用的bash shell选项的列表|
|BASHPID|当前bash进程的PID|
|COLUMNS|当前bash shell实例所用终端的宽度|
|COMP_CWORD|COMP_WORDS变量的索引值, 后者含有当前光标的位置|
|COMP_LINE|当前命令行|
|COMP_POINT|当前光标位置相对于当前命令起始的索引|
|COMP_KEY|用来调用shell函数补全功能的最后一个键|
|COMP_TYPE|一个整数值, 表示所尝试的补全类型, 用以完成shell函数补全|
|COMP_WORDBREAKS|Readline库中用于单词补全的词分隔字符|
|COMP_WORDS|含有当前函数行所有单词的数组变量|
|COMPREPLY|含有由shell函数生成的可能填充代码的数组变量|
|COPROC|占用未命名的协程的I/O文件描述符的数组变量|
|DIRSTACK|含有目录栈当前内容的数组变量|
|EMACS|设置为't'时, 表示emacs shell缓冲区正在工作, 而行编辑功能被禁止|
|ENV|如果设置了该环境变量, 在bash shell脚本运行前会先执行已定义的启动文件(仅用于当bash shell以POSIX模式被调用时)|
|EUID|当前用户的有效用户ID(数字形式)|
|FCEDIT|供fc命令使用的默认编辑器|
|FIGNORE|在进行文件名补全时可以忽略后缀名列表, 由冒号分隔|
|FUNCNAME|当前执行的shell函数的名称|
|FUNCNEST|当设置成非零值时, 表示所允许的最大函数嵌套级数(一旦超出, 当前命令即被终止)|
|GLOBIGNORE|冒号分隔的模式列表, 定义了在进行文件名扩展时可以忽略的一组文件名|
|GROUPS|含有当前用户属组列表的数组变量|
|histchars|控制历史记录扩展, 最多可有3个字符|
|HISTCMD|当前命令在历史记录中的编号|
|HISTCONTROL|控制哪些命令留在历史记录列表中|
|HISTFILE|保存shell历史记录列表的文件名(默认是.bash_history)|
|HISTFILESIZE|最多在历史文件中存多少行|
|HISTTIMEFORMAT|如果设置了非空, 就用作格式化字符串, 以显示bash历史中每条命令的时间戳|
|HISTIGNORE|由冒号分隔的模式列表, 用来决定历史文件中哪些命令会被忽略|
|HISTSIZE|最多在历史文件中村多少条命令|
|HOSTFILE|shell在补全主机名时读取的文件名称|
|HOSTNAME|当前主机的名称|
|HOSTTYPE|当前运行的bash shell的机器|
|IGNOREEOF|shell在退出前必须收到连续的EOF字符的数量(如果不存在, 默认为1)|
|INPUTRC|Readline初始化文件名(默认是.inputrc)|
|LANG|shell的语言环境类别|
|LC_ALL|定义了一个语言环境类别, 能够覆盖LANG变量|
|LC_COLLATE|设置对字符串排序时用的排序规则|
|LC_CTYPE|决定如何解释出现在文件名扩展和模式匹配中的字符|
|LC_MESSAGES|在解释前面带有$的双引号字符串时, 该环境变量决定了所采用的语言环境设置|
|LC_NUMERIC|决定着格式化数字时采用的语言环境设置|
|LINENO|当前执行的脚本的行号|
|LINES|定义了终端上可见的行数|
|MACHTYPE|用"CPU-公司-系统"格式定义的系统类型|
|MAPFILE|一个数组变量, 当mapfile命令未指定数组变量作为参数时, 它存储了mapfile所读入的文本|
|MAILCHECK|shell查看新邮件的频率(以秒为单位, 默认是60)|
|OLDPWD|shell之前的工作目录|
|OPTERR|设置为1时, bash shell会显示getopts命令产生的错误|
|OSTYPE|定义了shell所在的操作系统|
|PIPESTATUS|含有前台进程的退出状态列表的数组变量|
|POSIXLY_CORRECT|设置了的话, bash会以POSIX模式启动|
|PPID|bash shell父进程的PID|
|PROMPT_COMMAND|设置了的话, 在命令行主提示符之前会执行这条命令|
|PROMPT_DIRTRIM|用来定义当启用了\w或\W提示符字符转义时显示的尾部目录名的数量. 被删除的目录名会用一组英文句点替换|
|PS3|select命令的提示符|
|PS4|如果使用了bash的-x选项, 在命令行之前显示的提示信息|
|PWD|当前工作目录|
|RANDOM|返回一个0~32767的随机数(对其的赋值可作为随机树生成器的种子)|
|READLINE_LINE|当使用bind -x命令时, 存储Readline缓冲区的内容|
|READLINE_POINT|当使用bind -x命令时, 表示Readline缓冲区内容插入点的当前位置|
|REPLY|read命令的默认变量|
|SECONDS|自从shell启动到现在的秒数(对其赋值将会重置计数器)|
|SHELL|bash shell的全路径名|
|SHELLOPTS|已启用bash shell选项列表, 列表项之间以冒号分隔|
|SHLVL|shell的层级; 每次启动一个新bash shell, 该值增加1|
|TIMEFORMAT|指定shell的时间显示格式|
|TMOUT|select命令和read命令在没有输入的情况下等待多久(以秒为单位). 默认为0, 表示无限长|
|TMPDIR|目录名, 保存bash shell创建的临时文件|
|UID|当前用户的真实用户ID(数字形式)|

#### 定位系统环境变量
在登入Linux系统启动一个shell时, 默认情况下bash会在几个文件里朝找命令. 这些文件叫启动文件或环境文件. bash检查启动文件取决于启动shell的方式. 启动shell有三种方式: 
1. 登录时作为默认登陆shell
2. 作为非登录shell的交互式shell
3. 作为运行脚本的非交互式shell

#### 登录shell
登录shell会从5个不同的启动文件里读取命令
1. /etc/profile
2. $HOME/.bash_profile
3. $HOME/.bashrc
4. $HOME/.bash_login
5. $HOME/.profile  
其中, /etc/profile文件是系统上默认的bash shell的主启动文件. 系统上的每个用户登录时都会执行这个启动文件, 其余是针对用户的, 可根据个人需求定制

##### $HOME目录下的启动文件
shell会按照下列顺序, 运行第一个被找到的文件, 余下的则被忽略
```
    $HOME/.bash_profile
    $HOME/.bash_login
    $HOME/.profile
```
这里没有提到$HOME/.bashrc文件, 因为该文件通常通过其他文件运行的.

#### 交互式shell进程
不是登录时启动的shell 那么启动的shell叫做交互式shell. 交互式shell不会访问/etc/profile文件, 只会检查用户HOME目录中的.bashrc文件.  
.bashrc文件有两个作用: 一是查看/etc目录下通用的bashrc文件, 二是为用户提供一个定制自己的命令别名和私有脚本函数的地方

#### 非交互式shell
系统执行shell脚本时用的就是这种shell. 为了使这种shell也能获取环境变量, bash提供了BASH_ENV环境变量. 当启动一个非交互式shell时, 它会检查这个环境变量来查看要执行的启动文件. 但是大多数系统并未设置这个环境变量. 子shell会继承父shell的导出环境变量, 但不能继承父shell设置但未导出的局部变量.

#### 数据变量
要给某个环境变量设置多个值, 可以把值放在括号里, 值与值之间用空格分隔. 
```
$ mytest = (one two three four five)
$ echo $mytest
$ one
```
直接访问数组变量, 只会显示数组的第一个值. 如果需要引用一个单独的数组元素, 就必须使用其索引进行引用.