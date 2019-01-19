# Debug基本命令

## R: 查看、改变CPU寄存器的内容

### 查看寄存器内容
![](./assets/images/debug-r.png)

### 修改寄存器内容
![](./assets/images/debug-edit.png)

## D: 查看内存中的内容
如果想知道内存10000H处的内容, 可以用"d段地址:偏移地址"的格式来查看
![](./assets/images/debug-d-1.png)

## E: 改写内存中的内容
![](./assets/images/debug-e-1.png)

## U: 查看写入的或内存中原有的机器码所对应的汇编指令
![](./assets/images/debug-u-1.png)

## T: 执行一条或多条指令
简单地使用T命令, 可以执行CS:IP指向的指令
![](./assets/images/debug-t-1.png)
![](./assets/images/debug-t-2.png)

## A: 以汇编指令的形式在内存中写入机器指令
![](./assets/images/debug-a-1.png)