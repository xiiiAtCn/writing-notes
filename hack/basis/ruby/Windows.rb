require 'Win32API'

title = 'My Application'
text = 'Hello, world'
# Win32API.new的参数说明
# 1. 包含所需调用函数的系统DLL的名字
# 2. 想要调用的函数的名字
# 3. 描述每个参数格式的数组, 以便传递给该函数
# 4. 表示该函数返回何种数据类型的字符

Win32API.new('user32', 'MessageBox', %w{L P P L}, 'I').call(0, text, title, 0)