#### for命令
```
for var in list
do 
    commands
done
```
#### 读取列表中的复杂值
列表值中的单引号引起误解, 可以使用以下两种方式处理
1. 使用转义符号来将单引号转义
2. 使用双引号来定义用到单引号的值
for循环默认使用空格作为列表的分隔符

#### 从变量读取列表
```
#!/bin/zsh
list="Alabama Alaska Arizona Arkansas Colorado"
list=$list" Connecticut"
for state in list
do
    echo "Have you visited $state?"
done
```
#### 更改字段分隔符
for循环将空格作为分隔符, 是由一个叫IFS的特殊环境变量控制的, 叫作内部字段分隔符(internal field separator). IFS环境变量定义了bash shell用作字段分隔符的一系列字符. 默认情况下, bash会将下列字符当作字段分隔符. 默认情况下, bash shell会将下列字符当作字段分隔符: 空格, 制表符或换行符  
在处理代码量较大的脚本时, 可能在一个地方需要修改IFS的值, 然后忽略这次修改, 在脚本的其他地方沿用IFS的默认值. 一个可参考的安全实践是在改变IFS之前保存原来的IFS值, 之后再恢复它
```
    IFS.OLD = $IFS
    IFS = $'\n'
    <在代码中使用新的IFS值>
    IFS = $IFS.OLD
```

#### 用通配符读取目录
在bash中, 当目录或文件名中有空格时, 会导致出错, 为了避免这种情况, 需要将包含空格的变量用双引号引起来.

#### C语言风格的for命令
```
for (( variable assignment; condition; iteration process ))
do
    commands
done
```

#### while命令
```
while test command
do
    other commands
done
```

##### 多个测试命令
while命令允许在while语句定义多个测试命令, 但只有最后一个测试命令的退出状态码会被用来决定什么时候结束循环

#### until命令
until命令需要指定一个通常返回非零退出状态码的测试命令. 只有测试命令的退出状态码不为0, bash才会执行循环中列出的命令.
```
until test commands
do
    other commands
done
```

> shell会执行指定的多个测试命令, 只有最后一个命令成立才停止

#### 控制循环

##### break命令
1. 跳出单个循环  
在shell执行break命令时, 它会尝试跳出当前正在执行的循环.
2. 跳出内部循环  
在处理多个循环时, break命令会自动终止所在的最内层的循环.
3. 跳出外部循环  
break命令接受单个命令行参数值:  
```
    break n
```
其中n指定了要跳出的循环层级, 默认情况下, n为1.

##### continue命令

continue命令可以提前中止某次循环中的命令, 但并不会完全终止整个循环. 可以在循环内部设置shell不执行命令的条件. 和break一样, continue命令也允许通过命令行参数指定继续执行哪一级循环.

#### 处理循环的输出
在shell脚本中, 可以对循环的输出使用管道或进行重定向. 这可以通过在done命令之后添加一个处理命令来实现. 这种方法同样适用于将循环的结果管接给另一个命令

> read命令可以读取文本中一行参数
















