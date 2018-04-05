---
title: 类文件结构
date: 2018-4-3
categories: Java
tags: [class-file, ]
---
#### Class类文件的结构
Class文件是一组以8位字节为基础单位的二进制流, 各个数据项目严格按照顺序紧凑排列在Class文件之中, 中间没有添加任何分隔符. 当遇到需要占用8位字节以上空间的数据项时, 则会按照高位在前的方式分割成若干个8位字节进行存储. Class文件采用一种类似C语言结构体的伪结构来存储, 这种伪结构只有两种数据类型. 无符号数和表.  
无符号数属于基本的数据类型, 以u1、u2、u4、u8来分别代表1个字节、2个字节、4个字节和8个字节的无符号数. 无符号数可以用来描述数字、索引引用、数量值, 或者按照UTF-8编码构成字符串值.  
表是由多个无符号数或其他表作为数据项构成的符合数据类型, 所有表都习惯地以"_info"结尾. 表用于描述有层次关系的复合结构的数据, 整个class文件本质上就是一张表.

|类型|名称|数量|
|----|----|----|
|u4|magic|1|
|u2|minor_version|1|
|u2|major_version|1|
|u2|constant_pool_count|1|
|cp_info|constant_pool|constant_pool_count-1|
|u2|access_flags|1|
|u2|this_class|1|
|u2|super_class|1|
|u2|interfaces_count|1|
|u2|interfaces|interfaces_count|
|u2|fields_count|1|
|field_info|fields|fields_count|
|u2|methods_count|1|
|method_info|methods|methods_count|
|u2|attributes_count|1|
|attributes_info|attributes|attributes_count|

##### 魔数与Class文件的版本
class文件的前4个字节称为魔数. class文件的魔数为: 0xCAFEBABE

##### 常量池
常量池是Class文件结构中与其他项目关联最多的数据类型, 也是占用Class文件空间最大的数据项目之一, 同时还是在class文件中第一个出现的表类型数据项目. 常量池的入口需要放置一项u2类型的数据, 代表常量池计数值(constant_pool_count). 这个容量计数是从1开始的. 第0项常量空出来是有特殊考虑的, 这样做是为了满足后面某些指向常量池的索引值的数据在特定情况下需要表达"不引用任何一个常量池项目"的意思, 这种情况就可以把索引值置为0来表示.   
常量池主要存放两大类常量: 字面量和符号引用. 字面量如文本字符串, 被声明为final的常量值等. 而符号引用则属于编译原理方面的概念, 包括了下面三类常量: 
1. 类和接口的全限定名(Fully Qualified Name)
2. 字段的名称和描述符(Descriptor)
3. 方法的名称和描述
常量池中的每一个常量都是一个表, 共有11种结构, 这11种常量项的结构定义如下表所示.

<table>
    <thead>
        <th>常量</th>
        <th>项目</th>
        <th>类型</th>
        <th>描述</th>
    </thead>
    <tbody>
        <tr>
            <td rowspan="3">CONSTANT_Utf8_info</td>
            <td >tag</td>
            <td>u1</td>
            <td>值为1</td>
        </tr>
        <tr>
            <td>length</td>
            <td>u2</td>
            <td>UTF-8编码的字符串占用的字节数</td>
        </tr>
        <tr>
            <td>bytes</td>
            <td>u1</td>
            <td>长度为length的UTF-8编码的字符串</td>
        </tr>
        <tr>
            <td rowspan="2">CONSTANT_Integer_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为3</td>
        </tr>
        <tr>
            <td>bytes</td>
            <td>u4</td>
            <td>按照高位在前存储的int值</td>
        </tr>
        <tr>
            <td rowspan="2">CONSTANT_Float_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为4</td>
        </tr>
        <tr>
            <td>bytes</td>
            <td>u4</td>
            <td>按照高位在前存储的float值</td>
        </tr>
        <tr>
            <td rowspan="2">CONSTANT_Long_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为5</td>
        </tr>
        <tr>
            <td>bytes</td>
            <td>u8</td>
            <td>按照高位在前存储的long值</td>
        </tr>
        <tr>
            <td rowspan="2">CONSTANT_Double_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为6</td>
        </tr>
        <tr>
            <td>bytes</td>
            <td>u8</td>
            <td>按照高位在前存储的double值</td>
        </tr>
        <tr>
            <td rowspan="2">CONSTANT_Class_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为7</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向全限定名常量项的索引</td>
        </tr>
        <tr>
            <td rowspan="2">CONSTANT_String_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为8</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向字符串字面量的索引</td>
        </tr>
        <tr>
            <td rowspan="3">CONSTANT_Fieldref_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为9</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向声明字段的类或接口描述符CONSTANT_Class_info的索引项</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向字段描述符CONSTANT_NameAndType的索引项</td>
        </tr>
        <tr>
            <td rowspan="3">CONSTANT_Methodref_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为10</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向声明方法的类描述符CONSTANT_Class_info的索引项</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向名称及类型描述符CONSTANT_NameAndType的索引项</td>
        </tr>
        <tr>
            <td rowspan="3">CONSTANT_InterfaceMethodref_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为11</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向声明方法的接口描述符CONSTANT_Class_info的索引项</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向名称及类型描述符CONSTANT_NameAndType的索引项</td>
        </tr>
        <tr>
            <td rowspan="3">CONSTANT_NameAndType_info</td>
            <td>tag</td>
            <td>u1</td>
            <td>值为12</td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向该字段或方法名称常量 </td>
        </tr>
        <tr>
            <td>index</td>
            <td>u2</td>
            <td>指向该字段或方法描述符常量项的索引</td>
        </tr>
    </tbody>
</table>


##### 访问标志(access_flags)
访问标志用于识别一些类或接口层次的访问信息, 包括: 这个Class是类还是接口; 是否定义为public类型; 是否定义为abstract类型; 如果是类的话, 是否被声明为final.

|标志名称|标志值|含义|
|---|---|---|
|ACC_PUBLIC|0x0001|是否为public类型|
|ACC_FINAL|0x0010|是否被声明为final, 只有类可设置|
|ACC_SUPER|0x0020|是否允许使用invokespecial字节码指令, JDK1.2之后编译出来的类的这个标志为真|
|ACC_INTERFACE|0x0200|标识这是一个接口|
|ACC_ABSTRACT|0x0400|是否为abstract类型, 对于接口或抽象类来说, 此标志值为真, 其他类值为假|
|ACC_SYNTHETIC|0x1000|标识这个类并非由用户代码产生的|
|ACC_ANNOTATION|0x2000|标识这是一个注解|
|ACC_ENUM|0x4000|标识这是一个枚举|

##### 字段表集合
字段表(field_info)用于描述接口或类中声明的变量. 字段包括了类级变量或实例级变量, 但不包括在方法内部声明的变量. 可以包括的信息有: 字段的作用域、是类级变量还是实例级变量(static修饰符)、可变性(final)、并发可见性(volatile修饰符, 是否强制从主内存读写)、是否可序列化(transient修饰符)、字段数据类型(基本类型、对象、数组)、字段名称. 

|类型|名称|数量|
|---|---|---|
|u2|access_flags|1|
|u2|name_index|1|
|u2|descriptor_index|1|
|u2|attributes_count|1|
|attribute_info|attributes|attributes_count|
字段修饰符放在access_flags项目中, 它与类中的access_flags项目是非常相似的, 都是一个u2的数据类型, 其可设置的标志位和含义如下.

|标志名称|标志值|含义|
|----|----|----|
|ACC_PUBLIC|0x0001|字段是否public|
|ACC_PRIVATE|0x0002|字段是否private|
|ACC_PROTECTED|0x0004|字段是否protected|
|ACC_STATIC|0x0008|字段是否static|
|ACC_FINAL|0x0010|字段是否final|
|ACC_VOLATILE|0x0040|字段是否volatile|
|ACC_TRANSIENT|0x0080|字段是否transient|
|ACC_SYNTHETIC|0x1000|字段是否由编译器自动产生的|
|ACC_ENUM|0x4000|字段是否enum|
跟随access_flags标志的是两项索引值: name_index和descriptor_index. 它们都是对常量池的引用, 分别代表着字段的简单名称及字段和方法的描述符.  
1. 全限定名: 类的全限定名就是完整的包名加上类名, 不过会把"."换成"/"号, 会在全限定名后加";"表示全限定名结束.
2. 简单名称就是指没有类型和参数修饰的方法或字段名称.
3. 描述符: 描述字段的数据类型、方法的参数列表(包括数量、类型以及顺序)和返回值, 基本数据类型及代表无返回值的void类型都用一个大写字符来表示, 而对象类型则用字符L加上对象的全限定名来表示

|标识字符|含义|
|----|----|
|B|基本类型byte|
|C|基本类型char|
|D|基本类型double|
|F|基本类型float|
|I|基本类型int|
|J|基本类型long|
|S|基本类型short|
|Z|基本类型boolean|
|V|特殊类型void|
|L|对象类型|
对于数组类型, 每一维度将使用一个前置的"["字符来描述.  
用描述符来描述方法时, 按照先参数列表, 后返回值的顺序描述, 参数列表按照参数的严格顺序放在一组小括号"()"之内.  
字段集合不会列出从超类或父接口中继承而来的字段, 但可能列出原本Java代码中不存在的字段, 譬如在内部类中为了保持对外部类的访问性, 会自动添加指向外部类实例的字段.

##### 方法表集合
方法表的结构同字段表一样, 依次包括了访问标志、名称索引、描述符索引、属性表集合几项. 具体如下表所示

|类型|名称|数量|
|u2|access_flags|1|
|u2|name_index|1|
|u2|descriptor_index|1|
|u2|attributes_count|1|
|attribute_info|attributes|attributes_count|

方法表中, 所有标志位及其可取值如下表

|标志名称|标志值|含义|
|----|----|----|
|ACC_PUBLIC|0x0001|方法是否为public|
|ACC_PRIVATE|0x0002|方法是否为private|
|ACC_PROTECTED|0x0004|方法是否为protected|
|ACC_STATIC|0x0008|方法是否为static|
|ACC_FINAL|0x0010|方法是否为final|
|ACC_SYNCHRONIZED|0x0020|方法是否为synchronized|
|ACC_BRIDGE|0x0040|方法是否为编译器产生的桥接方法|
|ACC_VARARGS|0x0080|方法是否接受不定参数|
|ACC_NATIVE|0x0100|方法是否为native|
|ACC_ABSTRACT|0x0400|方法是否为abstract|
|ACC_STRICT|0x0800|方法是否为strictfp|
|ACC_SYNTHETIC|0x1000|方法是否是由编译器自动产生的|

##### 属性表集合
在Class文件、字段表、方法表都可以携带自己的属性表集合, 以用于描述某些场景专有的信息.

|属性名称|使用位置|含义|
|----|----|----|
|Code|方法表|Java代码编译成的字节码指令|
|ConstantValue|字段表|final关键字定义的常量值|
|Deprecated|类、方法表、字段表|被声明为deprecated的方法和字段|
|Exceptions|方法表|方法抛出的异常|
|InnerClass|类文件|内部类列表|
|LineNumberTable|Code属性|Java源码的行号与字节码指令的对应关系|
|LocalVariableTable|Code属性|方法的局部变量描述|
|SourceFile|类文件|源文件名称|
|Synthetic|类、方法表、字段表|标识方法或字段为编译器自动生成的|
对于每个属性, 它的名称需要从常量池中引用CONSTANT_Utf8_info类型的常量来表示. 一个符合规范的属性表应该满足下表定义的结构.
|类型|名称|数量|
|----|----|----|
|u2|attribute_name_index|1|
|u2|attribute_length|1|
|u1|info|attribute_length|

###### Code属性
如果方法表有Code属性存在, 那么它的结构将如下表所示.

|属性|名称|数量|
|----|----|----|
|u2|attribute_name_index|1|
|u4|attribute_length|1|
|u2|max_stack|1|
|u2|max_locals|1|
|u4|code_length|1|
|u1|code|code_length|
|u2|exception_table_length|1|
|exception_info|exception_table|exception_table_length|
|u2|attributes_count|1|
|attribute_info|attributes|attributes_count|

1. attribute_name_index是一项指向CONSTANT_Utf8_info型常量的索引, 常量值固定为Code. attribute_length指示了属性值的长度, 由于属性名称索引和属性长度一共是6个字节, 所以属性值的长度固定为整个属性表的长度减去6个字节.
2. max_stack代表了操作数栈深度的最大值. 虚拟机运行时需要根据这个值来分配栈帧(Frame)中的操作栈深度.
3. max_locals代表了局部变量表所需的存储空间. max_locals的单位是Slot. 对于byte、char、float、int、short、boolean、reference和returnAddress等长度不超过32位的数据类型, 每个局部变量占用1个Slot, 而double和long这两种64位的数据类型则需要2个Slot来存放. 方法参数、显式异常处理器的参数、方法体中定义的局部变量都需要使用局部变量表来存放.
4. code_length和code用来存储Java源程序编译后生成的字节码指令. code_length代表字节码长度, code用于存储字节码指令的一系列字节流. 每个指令都是一个u1类型的单字节. Java虚拟机定义了约200条编码值对应的指令含义. code_length虽然是u4类型的长度值, 理论上可以达到2<sup>32</sup>-1, 但是虚拟机规范中限制了一个方法不允许超过65535条字节码指令. 超过这个限制, javac编译器就会拒绝编译. 
5. 异常表是java代码的一部分, 编译器使用异常表来实现Java异常及finally处理机制. 属性表结构如下:

|类型|名称|数量|
|---|---|---|
|u2|start_pc|1|
|u2|end_pc|1|
|u2|handler_pc|1|
|u2|catch_type|1|

###### Exceptions属性
Exceptions属性的作用是列举出方法中可能抛出的受查异常, 也就是方法描述时在throw关键字后面列举的异常. 其结果如下表.

|类别|名称|数量|
|----|----|----|
|u2|attribute_name_index|1|
|u4|attribute_length|1|
|u2|number_of_exceptions|1|
|u2|exception_index_table|number_of_exceptions|
number_of_excepti项表示方法可能抛出number_of_exceptions种受查异常, 每一种受查异常使用一个exception_index_table项表示, 指向常量池种CONSTANT_Class_info型常量的索引, 代表了该受查异常的类型.

###### LineNumberTable属性
LineNumberTable属性用于描述Java源码行号与字节码行号之间的对应关系. 不是运行时的必需属性, 默认会生成到Class文件中, 可以在Javac中使用-g:none或-g:lines选项来取消或要求生成这项信息. 不选择生成LineNumberTable属性, 在抛出异常时, 堆栈中将不会显示出错的行号., 并且在调试程序时无法按照源码来设置断点. 其属性结构如下:

|类型|名称|数量|
|----|----|----|
|u2|attribute_name_index|1|
|u4|attribute_length|1|
|u2|line_number_table_length|1|
|line_number_info|line_number_table|line_number_table_length|

###### LocalVariableTable属性
用来描述栈帧中局部变量表中的变量与Java源码中定义的变量之间的关系, 它不是运行时必需的属性, 默认也不会生成到Class文件中, 可以在Javac中使用-g:none或-g:vars选项来取消或要求生成这项信息. LocalVariableTable属性的结构如下表所示:
|类型|名称|数量|
|----|----|----|
|u2|attribute_name_index|1|
|u4|attribute_length|1|
|u2|local_variable_table_length|1|
|local_variable_info|local_variable_table|local_variable_table_length|
其中local_variable_info代表了一个栈帧与源码中的局部变量的关联.

|类型|名称|数量|
|----|----|----|
|u2|start_pc|1|
|u2|length|1|
|u2|number_index|1|
|u2|descriptor_index|1|
|u2|index|1|
start_pc和length属性分别代表了这个局部变量的生命周期开始的字节码偏移量及其作用范围覆盖的长度, 两者结合起来就是这个局部变量在字节码之中的作用范围.

###### SourceFile属性
SourceFile属性用于记录生成这个Class文件的源码文件名称. 这个属性也是可选的, 可以使用Javac的-g:none或-g:source选项来关闭或要求生成这项信息. 这个属性是一个定长属性, 其结构如下表所示:

|类型|名称|数量|
|----|----|----|
|u2|attribute_name_index|1|
|u4|attribute_length|1|
|u2|sourcefile_index|1|
sourcefile_index数据项是指向常量池种CONSTANT_Utf8_info型常量的索引, 常量值是源码文件的文件名

###### ConstantValue属性
ConstantValue属性的作用是通知虚拟机自动为静态变量赋值. 只有被static关键字修饰的变量才可以使用这项属性. 对于"int x = 3"和"static int x = 3", 虚拟机对这两种变量赋值的方式和时刻都有所不同. 对于非static类型的变量的赋值是在实例构造器<init>方法种进行的; 而对于类变量, 则有两种方式可以选择, 赋值在类构造器<clinit>方法种进行, 或者使用ConstantValue属性来赋值. Sun Javac编译器的选择是:
1. 如果同时使用final和static来修饰一个变量, 并且这个变量的数据类型是基本类型或String的话, 就生成ConstantValue属性来进行初始化, 如果这个变量没有被final修饰, 或者并非基本类型及字符串, 则选择在<clinit>方法中进行初始化. ConstantValue属性的结构如下表所示.

|类型|名称|数量|
|u2|attribute_name_index|1|
|u4|attribute_length|1|
|u2|constantvalue_index|1|

###### InnerClass属性
InnerClass属性用于记录内部类与宿主类之间的关联. 如果类中定义了内部类, 那编译器将会为它及它所包含的内部类生成InnerClass属性. 属性的结构如下表所示.

|类型|名称|数量|
|----|----|----|
|u2|attribute_name_index|1|
|u4|attribute_length|1|
|u2|number_of_classes|1|
|inner_classes_info|inner_classes|number_of_classes|
每一个内部类信息都由一个inner_classes_info表进行描述. 结构如下:

|类型|名称|数量|
|----|----|----|
|u2|inner_class_info_index|1|
|u2|outer_class_info_index|1|
|u2|inner_name_index|1|
|u2|inner_class_access_flags|1|
inner_class_info_index和outer_class_info_index都是指向常量池中CONSTANT_Class_info型常量的索引. inner_name_index是指向常量池中CONSTANT_Utf8_info型常量的索引, 代表这个内部类的名称, 匿名内部类值为0. inner_class_access_flags是内部类的访问标志, 类似于access_flags, 它的取值如下表:
|标志名称|标志值|含义|
|ACC_PUBLIC|0x0001|内部类是否为public|
|ACC_PRIVATE|0x0002|内部类是否为private|
|ACC_PROTECTED|0x0004|内部类是否为protected|
|ACC_STATIC|0x0008|内部类是否为static|
|ACC_FINAL|0x0010|内部类是否为final|
|ACC_INTERFACE|0x0020|内部类是否为interface|
|ACC_ABSTRACT|0x0400|内部类是否为abstract|
|ACC_SYNTHETIC|0x1000|内部类是否并非由用户代码产生|
|ACC_ANNOTATION|0x2000|内部类是否是一个注解|
|ACC_ENUM|0x4000|内部类是否是一个枚举|

###### Deprecated及Synthetic属性
这两个属性都属于标志类型的布尔属性, 只存在有和没有的区别. 所有由非用户代码产生的类、方法及字段都应当至少设置Synthetic属性和ACC_SYNTHETIC标志位中的一项, 唯一的例外是实例构造器"<init>"方法和类构造器"<clinit>"方法.