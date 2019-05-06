## cmdlet 
一个用来和任何管理实体(包括操作系统)进行交互的简单命令. 等价于其它外壳程序中的系统内置命令. 传统的外壳程序把各种命令当作是独立的可执行程序, 但是cmdlet则是一个.NET类的实例, 运行于PowerShell进程内.

### 几个常用的命令
1. get-help
2. get-command cmdlet: 查询系统中有哪些可用的命令
3. get-number 查询类型的成员
4. New-object: 新建一个COM对象, -com参数指定了该COM类的标识ID.
5. get-wmiobject: 获取特定的WMI对象

## snap-in
提供了一个可拓展的体系结构以便向外壳程序中添加新的功能. 通过get-pssnapin命令可查看snap-in列表
