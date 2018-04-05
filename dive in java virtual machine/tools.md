---
title: 虚拟机性能监控与故障处理工具
date: 2018-3-30
categories: Java
tags: [jvm, tools]
---

#### JDK的命令行工具

##### jps: 虚拟机进程状况工具
JVM Process Status Tool, 显示指定系统内所有的HotSpot虚拟机进程. 可以列出正在运行的虚拟机进程, 并显示虚拟机执行主类(Main Class, main()函数所在的类)的名称, 以及这些进程的本地虚拟机的唯一ID(LVMID, Local Virtual Machine Identifier). 对于本地虚拟机进程来说, LVMID与操作系统的进程ID(Process Identifier)是一致的. jps可以通过RMI协议查询开启了RMI服务的远程虚拟机进程状态, hostid为RMI注册表中注册的主机名.
```
jps [ options ] [ hostid ]
```
其他常用选项如下:
1. -q: 只输出LVMID, 忽略主类的名称
2. -m: 输出虚拟机进程启动时传递给主类main()函数的参数
3. -l: 输出主类的全名, 如果进程执行的时Jar包, 输出Jar路径
4. -v: 输出虚拟机启动时的JVM参数

##### jstat: 虚拟机统计信息监视工具
jstat(JVM Statistics Monitoring Tool)是用于监视虚拟机各种运行状态信息的命令行工具. 可以显示本地或远程虚拟机进程中的类装载、内存、垃圾收集、JIT编译等运行数据. 命令格式为
```
jstat [option vmid interval[s|ms] [count]]
```
命令中的VMID与LVMID对本地虚拟机来说是一致的. 如果是远程虚拟机, 那么VMID的格式为:
```
    [protocol:][//]vmid[@hostname[:port]/servername]
```
参数interval和count代表查询间隔和次数, 如果省略则只查询一次  
选项option代表用户希望查询的虚拟机信息, 主要分为3类: 类装载、垃圾收集和运行期编译状况.
1. -class: 监视类装载、卸载数量、总空间及类装载所耗费的时间
2. -gc: 监视Java堆状况, 包括Eden区、2个survivor区、老年代、永久代等的容量、已用空间、GC时间合计等信息
3. -gccapacity: 监视内容与-gc基本相同, 但输出主要关注Java堆各个区域使用到的最大和最小空间
4. -gcutil: 监视内容与-gc基本相同, 但输出主要关注已使用空间占总空间的百分比
5. -gccause: 与-gcutil功能一致, 但是会额外输出上一次GC产生的原因
6. -gcnew: 监视新生代GC的状况
7. -gcnewcapacity: 监视内容与-gcnew基本相同, 输出主要关注使用到的最大和最小空间
8. -gcold: 监视老年代GC的状况
9. -gcoldcapacity: 监视内容与-gcold基本相同, 输出主要关注使用到的最大和最小空间
10. -gcpermcapacity: 输出永久代使用到的最大和最小空间(jdk8版本中已无此选项)
11. -compiler: 输出JIT编译器编译过的方法、耗时等信息
12. -printcompilation: 输出已经被JIT编译的方法

>远程显示的话需要远程主机提供RMI支持, Sun提供了jstatd工具可以很方便地建立远程RMI服务器

##### jinfo: Java配置信息工具
jinfo(Configuration Info for Java)的作用是实时地查看和调整虚拟机的各项参数. jps命令的-v参数可以查看虚拟机启动显式指定的参数列表, 但如果想知道未被显式指定的参数的系统默认值, 就只能使用jinfo的-flag选项进行查询(jdk6及以上也可以使用-XX:+PrintFlagsFinal来查看所有参数的最终值).命令格式:
```
    jinfo [ option ] pid
```

##### jmap: Java内存映像工具
jmap(Memory Map for Java)命令用于生成堆转储快照(heapdump或dump文件). 通过linux下的kill -3 命令发送进程退出信号就可以拿到dump文件. jmap命令格式:
```
    jmap [ option ] vmid
```
执行该命令需要虚拟机开启debugger选项
选项可以包含下列几种:
1. -dump: 生成Java堆转储快照, 格式为-dump:[live,]format=b,file=<filename>, 其中live子参数说明是否只dump出存活的对象
2. -finalizerinfo: 显示F-Queue中等待Finalizer线程执行finalize方法的对象
3. -heap: 显示Java堆详细信息, 如使用哪种回收器、参数配置、分代情况等
4. -histo: 显示堆中对象统计信息, 包括类、实例数量和合计容量
5. -F: 当虚拟机进程对-dump选项没有响应时, 可以使用这个选项强制生成dump快照
6. -J: 将信号直接传入运行环境

##### jhat: 虚拟机堆转储快照分析工具
jhat(JVM Heap Analysis Tool)命令与jmap搭配使用, 来分析jmap生成的堆转储快照. jhat内置了一个微型的HTTP/HTML服务器, 生成dump文件的分析结果后, 可以在浏览器中查看.

##### jstack: Java堆栈跟踪工具
jstack(Stack Trace for Java)命令用于生成虚拟机当前的线程快照(一般称为threaddump或javacore文件)

#### 可视化工具

##### JConsole: Java监视与管理控制台
JConsole(Java Monitoring and Management Console)是基于JMX的可视化监视和管理的工具. MBean可以使用代码、中间件服务器的管理控制台或者符合JMX规范的软件进行管理.

###### 内存监控
相当于可视化的jstat命令. 用于监视受收集器管理的虚拟机内存的变化趋势.

###### 线程监控
"线程"页签的功能相当于可视化的jstack命令

##### VisualVM: 多合一故障处理工具
VisualVM(All-in-One Java Troubleshooting Tool)是一款虚拟机故障处理工具.VisualVM不需要被监视的程序基于特殊Agent运行.  
BTrace动态日志跟踪
```java
/* BTrace Script Template */
import com.sun.btrace.annotations.*;
import static com.sun.btrace.BTraceUtils.*;

@BTrace
public class TracingScript {
	/* put your code here */
    @OnMethod(clazz="site.lungern.blog.tools.BTraceTest",
    method="add",
    location=@Location(Kind.RETURN))
    public static void func(@Self site.lungern.blog.tools.BTraceTest instance, int a, int b, @Return int result) {
        println("调用堆栈:");
        jstack();
        println(strcat("方法参数A:", str(a)));
        println(strcat("方法参数B:", str(b)));
        println(strcat("方法结果:", str(result)));
    }
}
```