#### if-then语句
命令的退出状态码为0, 位于then部分的命令就会被执行.
```
if command
then
    commands
fi
```
#### if-then-else语句
执行条件与上面的相同
```
if command
then 
    commands
elif command
then
    commands
else
    commands
fi
```

#### test
如果不写test命令的condition部分, 它会以非零的退出码退出
```
test condition
```
bash中提供了另外一种条件测试方法, 无需在if-then语句中生命test命令
```
if [ condition ]
then
    commands
fi
```
test命令常见的情形是进行数值比较, 比较不是数学符号, 而是字母
1. -eq: 相等
2. -ge: 大于等于
3. -gt: 大于
4. -le: 小于等于
5. -lt: 小于
6. -ne: 不等于

#### 字符串比较
1. =: 相同
2. !=: 不同
3. <: 小于
4. >: 大于
5. -n str: 长度是否非0
6. -z: 长度是否为0
大于号(>)和小于号(<)必须转义; 大于和小于和sort命令采用的不同, 比较采用的是标准的ASCII顺序

#### 文件比较
允许测试Linux文件系统上文件和目录的状态
1. -d file: 检查file是否存在并是一个目录
2. -e file: 检查file是否存在
3. -f file: 检查file是否存在并是一个文件
4. -r file: 检查file是否存在并可读
5. -s file: 检查file是否存在并非空
6. -w file: 检查file是否存在并可写
7. -x file: 检查file是否存在并可执行
8. -O file: 检查file是否存在并属于当前用户所有
9. -G file: 检查file是否存在并默认组与当前用户相同
10. file1 -nt file2: 检查file1是否比file2新
11. file1 -ot file2: 与-nt相反

#### 符合条件测试
if-then语句允许布尔逻辑来组合测试
```
[condition1] && [condition2]
[condition1] || [condition2]
```

#### 高级特性

##### 双括号
双括号允许在比较过程中使用高级数学表达式. 可以支持下列运算
1. val++
2. val--
3. ++val
4. --val
5. !(逻辑求反)
6. ~(位求反)
7. **(幂)
8. <<(左移)
9. >>(右移)
10. & (布尔和)
11. |(布尔或)
12. &&(逻辑和)
13. ||(逻辑或)

#### 双中括号
```
    [[ expression ]]
```
双方括号里的expression使用了test命令中采用的标准字符串比较. 但它提供了test命令未提供的另一个特性--模式匹配

#### case命令
```
case variable in
pattern1 | pattern2) commands1;;
pattern3) commands2;;
*) default commands;;
esac
```