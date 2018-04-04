---
title: java调试工具出现问题及解决办法
date: 2018-4-2
categories: Java
tags: [resolution, tools]
---

#### 使用jstack或jmap生成dump文件异常
在Ubuntu 16.04上使用jstack或jmap这类可以生成java运行时dump文件的命令时, 会出现以下异常:
```java
Error attaching to process: sun.jvm.hotspot.debugger.DebuggerException: Can't attach to the process: ptrace(PTRACE_ATTACH, ..) failed for 2956: Operation not permitted
sun.jvm.hotspot.debugger.DebuggerException: sun.jvm.hotspot.debugger.DebuggerException: Can't attach to the process: ptrace(PTRACE_ATTACH, ..) failed for vmid: Operation not permitted
```
从Ubuntu官方论坛得知, Ubunutu从10.10版本开始, Ubuntu不允许非root用户执行不属于子进程的ptrace操作. 不过也提供了解决方案. 如果需要临时禁用这个限制, 可以进行如下操作:
```bash
echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
```
如果需要永久禁用此限制, 可以通过修改文件/etc/sysctl.d/10-ptrace.conf中的配置信息
```
kernel.yama.ptrace_scope=1
to
kernel.yama.ptrace_scope=0
```