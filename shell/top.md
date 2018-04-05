#### 进程详细列表中的主要列及其含义
1. PID: 进程的PID
2. USER: 进程属主的名字
3. PR(priority): 进程的优先级
4. NI(nice): 进程的谦让度值
5. VIRT(virtual): 进程占用的虚拟内存总量
6. RES(?): 进程占用的物理内存总量
7. SHR(share): 进程和其他进程共享的内存总量
8. S(status): 进程的状态
    1. D: [discontinue](https://cn.bing.com/dict/search?q=discontinue), 代表可中断的休眠状态
    2. R: run, 代表在运行状态
    3. S: sleep, 代表休眠状态
    4. T: trace, 代表跟踪状态或停止状态
    5. Z: zombie, 代表僵化状态
9. %CPU: 进程使用的CPU时间比例
10. %MEM(memory): 进程使用的内存占可用内存的比例
11. TIME+: 自进程启动到目前为止的CPU时间总量
12. COMMAND: 进程所对应的命令行名称, 也就是启动的程序名




#### 参考文档
1. [Linux的进程优先级 NI 和 PR 有什么区别](http://www.yunweipai.com/archives/7308.html)