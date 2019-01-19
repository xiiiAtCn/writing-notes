# 在win10上学习8086汇编

## 安装debug.exe

由于win10默认没有debug.exe文件, 所以需要手动下载. 下载地址: [debug.exe](./assets/debug.exe).

## 安装DOSBox
下载地址: [DOSBox](https://www.dosbox.com/download.php?main=1). 安装完成之后, 进入命令行界面. 然后将debug.exe所在的磁盘做一次挂载操作. 例如将本地的D盘挂载到DOS的C盘下.
```cmd
Z:\> mount c D:\
Drive C is mounted as local directory D:\
z:\> c:\
C:\> cd DOS
C:\DOS> debug
-_
```
## 编译器masm安装
汇编程序的编译器有很多种, 这里采用了masm. 这里提供了一个[压缩包](./assets/8086_Assembler.zip), 除了masm外, 还有很多工具. 为了保证操作的方便, 最好将解压之后的exe文件与debug.exe放在同一个文件夹下.