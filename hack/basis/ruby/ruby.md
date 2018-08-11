### 数组
#### 创建数组并插入元素
```ruby
x = []
x << "Word"
x << "Play"
x << "Fun"
puts x.pop
puts x.pop
puts x.length
```
#### join
```ruby
x = ["World", "Play", "Fun"]
puts x.join
```
#### 字符串切分成数组
```ruby
puts "This is a test".split(/\w/).join(',')

puts "Short sentence. Another. No more".split(/\./).inspect
```
> inspect: 几乎所有内置类都有inspect方法, 它给出对象的文本化表示形式.

#### 数组迭代
```ruby
[1, 'test', 2, 3, 4].each { |element| puts element.to_s + 'x'}

[1, 2, 3, 4].collect { |element| element * 2}

a = [1, 2, 3, 4]
i = 0

while ( i < a.length)
    puts a[i].to_s + 'x'
    i+ = 1
end
```

#### 数组加法和串联
```ruby
x = [1, 2, 3]
y = ['a', 'b', 'c']
z = x + y
w = x - y
puts z.inspect
puts w
```
#### 检查数组是否为空
```ruby
x = []
puts 'x is empty' if x.empty?
```

#### 检查数组是否有某个元素
```ruby
x = [1, 2, 3]
puts x.include?('x')

puts x.include?(1)
```

#### 访问第一个和最后一个元素
```ruby
x = [1, 2, 3]
puts x.first
puts x.last
```

#### 反转数组元素的顺序
```
x = [1, 2, 3]
puts x.reverse.inspect
```

### 散列表
> 键和值都可以是任何类型的对象

#### 在散列表元素中迭代
```ruby
x = { "a" => 1, "b" => 2}
x.each {|key, value| puts "#{key} equals #{value}"}
```

#### 检索键
```ruby
x={"x" => 1, "y" => 2, "z" => 3}
puts x.keys.inspect
```

#### 删除散列表中的元素
```ruby
x = {'a' => 1, 'b' => 2}
x.delete('a')
puts x.inspect
```

### 流程控制

#### if与unless
```ruby
age = 10
if age < 18
    puts "You're too young to use this system"
end

unless age >= 18
    puts "You are too young to use this system"
end
```
#### 三元运算符
```ruby
age = 10
type = age < 18 ? "child": "adult"
puts type
```

#### elsif与case
elsif
```ruby
fruit = "orange"
if fruit == "orange"
    color = "orange"
elsif fruit == "apple"
    color = "green"
elsif fruit == "banana"
    color = "yellow"
else 
    color = "unknown"
end
```
case
```
fruit = "orange"
case fruit
    when "orange"
        color = "orange"
    when "apple"
        color = "green"
    when "banana"
        color = "yellow"
    else
        color = "unknown"
end 
```

#### while与until
while
```ruby
    x = 1
    while x < 100
        puts x
        x *= 2
    end
```
unless
```ruby
    x = 1
    until x > 100
        puts x
        x *= 2
    end
```

#### 代码块
代码块的定义位于{和}符号之间, 或位于do和end分界符之间

编写方法来处理代码块
```ruby
def each_vowel(&code_block) 
    %w{a e i o u}.each { |vowel| code_block.call(vowel)}
end
each_vowel { |vowel| puts vowel }
```
使用yield. 它能自动检测传递给它的代码块, 并将控制权移交给该代码块
```ruby
def each_vowel
    %w{a e i o u}.each { |vowel| yield vowel}
end
each vowel {|vowel| puts vowel }

```
也可以使用lambda方法, 把代码块存储在变量中
```ruby
print_parameter_to_screen = lambda { |x| puts x }
print_parameter_to_screen.call(100)
```
### 其他内置元素

#### 日期与时间
Time对象用于访问日期/时间属性的方法

|方法|方法的返回值|
|---|---|
|hour|表示24小时格式的数字|
|min|整点之后经过的分钟数|
|sec|整分钟之后经过的秒数|
|usec|整秒之后经过的微秒数|
|day|日期是该月的第几天|
|mday|与day方法同义|
|wday|按周记的天数(星期天是0, 星期六是6)|
|yday|按年计的天数|
|month|日期的月份数值|
|year|日期关联的年份|
|zone|返回日期关联的时区名|
|utc?|根据时间/日期是否在UTC/GMT时区, 返回true或false|
|gmt?|与utc?方法同义|

> 均为只读, 而无法设置属性. 修改日期或事件, 需要用Time.gm或Time.local方法创建新的Time对象