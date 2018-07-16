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