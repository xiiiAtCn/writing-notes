#### MSFconsole核心命令手册
`MSFconsole`有很多可供选择的命令参数。下面就是`Metasploit`的一组核心命令， 附带这些命令的输出描述。

* `back` 从当前上下文中返回
* `banner` 显示一个惊艳的`Metasploit`标语
* `cd` 更改当前的工作目录
* `color` 切换颜色
* `connect` 与某个主机通信
* `edit` 通过$VISUAL或$EDITOR参数指定的编辑器编辑当前模块
* `get` 获得当前上下文指定的变量的值
* `getg` 获取全局变量的值
* `go_pro` 启动`Metasploit`的web页面
* `grep` 对另一个命令的输出进行`grep`操作
* `help` 帮助菜单
* `info` 显示一个或多个模块的信息
* `jobs` 显示、管理任务
* `kill` 结束一个任务
* `load` 加载一个框架插件
* `loadpath` 从路径中中寻找并加载模块
* `makerc` 保存从开始到文件输入的命令
* `popm` 从栈中取出最新的模块并激活
* `previous` 设置之前加载的模块作为当前模块
* `pushm` 将当前激活的模块或一组模块推入模块栈
* `quit` 退出命令行
* `reload_all` 重新加载所有指定了模块路径的模块
* `rename_job` 重命名任务
* `resource` 执行保存在文件中的命令
* `route` 通过会话路由流量
* `save` 保存当前活动的数据存储
* `search` 搜索模块名称和描述
* `set` 设定特定上下文中的变量的值
* `setg` 设定全局变量的值
* `show` 显示给定类型的模块， 或全部模块
* `sleep` 在指定的时间(s)内什么也不做
* `spool` 将控制台输出在输出到屏幕的同时写入文件中
* `threads` 显示并操纵后台线程
* `unload` 卸载一个框架模块
* `unset` 重置一个或多个特定上下文的变量
* `unsetg` 重置一个或多个全局环境变量
* `use` 通过名字选择一个模块
* `version` 显示框架和控制台库的版本号