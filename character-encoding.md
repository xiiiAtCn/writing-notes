---
title: 中文字符编码简介
date: 2018-2-26
categories: fundmental
tags: character, encoding
---
#### 基础知识

##### 字节和字符的区别
对于使用英文的地区来说, [ASCII](https://zh.wikipedia.org/wiki/ASCII)标准中定义的字符已经可以满足使用. 加上33个无法显示的字符, ASCII标准中总共定义了128个字符.这些字符使用一个字节即可以一一映射.因此, 对于英文系统来说, 当说到字符时, 字节和字符在一定程度上就是等同的.但对于使用象形文字的国家来说, 如中国, 日本, 韩国等, 一个字节已经无法表示如此繁多的字体.因此, 发展出了各种各具特色的字符集. 如简体中文中常用的GB2312, 及繁体中文的big5.  
字节(octet)是一个八位的存储单元, 取值范围是0~255. 而字符(character, 或者word)为语言意义上的符号, 范围则不尽相同. 如在UTF-8编码中, 字符占用的长度各不相同, 根据字符在Unicode中的编码不同, 字符可能会占用一个字节, 两个字节或三个字节等.
##### Unicode与ISO 10646
谈到这个, 就不得不说到两个著名的组织: [国际标准化组织(ISO)](https://en.wikipedia.org/wiki/International_Organization_for_Standardization)和[统一码联盟(Unicode_Consortium)](https://unicode.org/). ISO于1984创建了[ISO/IEC JTC1/SC2/WG2工作组](http://unicode.org/wg2/), 试图制定一份<b>通用字符集</b>(Universal Character Set, 简称UCS), 并最终制定了[ISO 10646](https://www.iso.org/standard/56921.html)标准.而统一码联盟则由[Xerox](https://www.xerox.com/), [Apple](https://www.apple.com/)等软件制造商于1988年成立, 并且开发了[Unicode](https://unicode.org/)标准. 1991年前后, 两个项目的开发人员意识到没有必要开发两个不兼容的字符集, 于是开始为创建一个单一编码表而协同工作.从Unicode 2.0开始, Unicode采用了与 ISO 10646-1相同的字库和代码;ISO也承诺, ISO 10646将不会替超出U+10FFFF的UCS-4编码赋值, 以使得两者保持一致, 两个项目仍然独立存在, 并且独立公布各自的标准.

#### Unicode介绍
统一码联盟在1991年首次推出了The Unicode Standard. 自版本2.0开始保持了向后兼容, 即新的版本仅仅增加字符, 原有字符不会被删除或更名.
##### 设计原则
在[《The Unicode Standard Version 6.2 – Core Specification》](http://www.unicode.org/versions/Unicode6.2.0/ch02.pdf), 给出了Unicode的十大设计原则：
1. Universality: 提供单一、综合的字符集, 编码一切现代与大部分历史文献的字符.
2. Efficiency: 易于处理与分析
3. Character, not glyphs: 字符, 而不是字形
4. Sematics: 字符要有良好定义的语义
5. Plain text: 仅限于文本字符(不知道emoji算不算打破了这条原则 :blush: )
6. Logical order: 默认内存表示其逻辑序
7. Unification: 把不同语言的同一书写系统中相同字符统一起来
8. Dynamic composition: 附加符号可以动态组合
9. Stability: 已分配的字符与语义不再改变
10. Convertibility: Unicode与其他著名字符集可以精确转换
##### 编码方式
目前Unicode字符17个组编排,从0x000000至0x10FFFF, 每个平面包含2<sup>16</sup>(65536)个码位(code point), 而第一个平面称为"基本多语言平面"(Basic Multilingual Plane, 简称BMP), 其余平面称为"辅助平面"(Supplementary Planes).其中BMP中的0xD800~0xDFFF之间的码位作为保留.

#### Unicode常用实现
Unicode是一个很大的集合, 现在的规模可以容纳100多万个符号, 每个符号的编码都不一样. 如, U+03B1表示希腊字母α, U+0061表示英语小写字母a, 而汉字中的'小'在Unicode中表示为U+5C0F. 但Unicode只是一个字符集, 它只是规定了符号的二进制表示, 但没有规定这个二进制代码应该如何存储. 如汉字'小'的Unicode是十六进制数5C0F, 用二进制数表示为101110000001111, 也就是说至少需要两个字节才能表示. 表示那些Unicode值更大的字符, 可能需要三个字符或更多.  
这就出现了一个问题. 如何区别Unicode和ASCII. ASCII符号只需要一个字节就可以存储, 但是计算机如何知道存储的是汉字还是ASCII字符呢? 那么, 出现了Unicode的多种存储方式, 即出现了多种字符编码.  
##### UTF-32与UCS-4
在Unicode与ISO 10646合并之前, ISO 10646标准为UCS定义了一种31位的编码形式(即UCS-4), 其编码固定占用4个字节. 编码范围为0x00000000 ~ 0x7FFFFFF. UCS-4有20多亿个编码空间, 但为了与Unicode标准兼容, 超出0x10FFFF的编码空间并没有被赋值. Unicode标准与之对应, 提出了UTF-32编码, 它的编码值与UCS-4相同, 只不过编码空间被限定在了0x000000 ~ 0x10FFFF之间. 因此, 也可以说UTF-32是UCS-4的一个子集. UTF-32使用四个字节表示代码点. 并且根据有无BOM字符, UTF-32包括UTF-32, UTF-32BE和UTF-32LE这三种编码. 关于他们之间的区别, 在下面[一节](#edian)会提到.
##### UTF-16与UCS-2
除了UCS-4外, ISO 10646标准为UCS定义了一种16位的编码形式(即UCS-2), 其编码固定占用2个字节,, 它包含65536个编码空间, 但为了与Unicode兼容, 0xD800 ~ 0xDFFF之间的码位并未使用. 但UCS-2并不能表示Unicode中定义的全部字符, 于是UTF-16横空出世. UTF-16由[RFC2781](https://www.ietf.org/rfc/rfc2781.txt)规定. UTF-16采用变长编码. 处于BMP平面的字符, 采用和UCS-2相同的双字节编码. 对于处于辅助平面的字符, UTF-16的编码长度为4字节, 并采用以下方式进行编码. 在辅助平面的字符, 用他们在Unicode中码位减去0x10000, 则可以得到一个0x00 ~ 0xFFFFF的区间中的值, 将这些值用一个20-bits的数字表示. 该数字的前10位(bits)加上0xD800, 就得到UTF-16四字节编码中的前两个字节; 该数字的后10位(bits)加上0xDC00, 就得到UTF-16四字节编码中的后两个字节.
##### UTF-8
从上述内容可以看出: 无论是使用UTF-32还是使用UTF-16, 一个字符都需要使用多个字节来编码, 不管是英语系国家, 还是亚洲国家, 这都是一种浪费.由此, [RFC3629](https://www.rfc-editor.org/rfc/rfc3629.txt)提出了一种更加灵活的变长编码方案----UTF-8.
UTF-8最大的特点, 就是它是一种变长的编码方式. 它可以使用1 ~ 4个字节表示一个符号, 根据不同的符号而变化字节长度.规则很简单, 只有两条.  
1. 对于单字节字符, 字节的第一位是0, 后面7位为这个字符的Unicode码. 因此, 对于英语字母和阿拉伯数字, UTF-8编码和ASCII码是相同的. 
2. 对于n字节的字符(n > 1), 第一字节的前n为都为1,  第n+1位为0, 后面字节的前两位一律为10, 剩下的二进制位, 全部位这个字符的Unicode码.  
使用表格总结以上规则如下  

|Unicode符号范围(十六进制)|UTF-8编码方式|说明|
|---|---|---|
|0000 0000-0000 007F|0xxxxxxx|x表示字符的二进制形式的Unicode编码|
|0000 0080-0000 07FFF|110xxxxx 10xxxxxx||
|0000 0800-0000 FFFF|1110xxxx 10xxxxxx 10xxxxxx||
|0001 0000-0010 FFFF|11110xxx 10xxxxxx 10xxxxxx||

##### <span id="edian">Big endian和Little endian</span>
在几乎所有的机器上, 多字节对象都被存储为连续的字节序列. 而存储地址内的排列则有两个通用规则. 一个多位的整数(编码单元)将按照其存储地址的最低或最高字节排序, 即字节序指的是编码单元内部的字节顺序. 如果最低有效位在最高有效位的前面, 则称小端序(Little edian), 反之则称大端序. 如一个十六进制数0xABCD, 在内存中存放的首地址为0x100~0x101, 如果是小端存储为: 0x100: CD AB , 如果是大端存储则为: 0x100: AB CD. 对于UTF-16和UTF-32编码来说, 总是以2个字节为编码单元, 编码单元的字节数大于1, 因此就会出现大端序或小端序两种不同的形式. 而对于UTF-8编码来说, 编码单元是单字节, 因此就不存在大端或小端的问题了. 而我们如何区分一个文件是采用大端序还是小端序呢? 这就需要BOM(byte order mark, 字节顺序标记). BOM用在文件的开头, 标记编码方案, 标记大小端序. 下表列出了常见的字符编码的BOM信息

|编码类型|BOM|
|:---|:---|
|UTF-8 without BOM| 无 |
|UTF-8 with BOM| EF BB BF|
|UTF-16LE| FF FE|
|UTF-16BE| FE FF|
|UTF-32LE| FF FE 00 00|
|UTF-32BE| 00 00 FE FF|
下面, 就以"小"字为示例进行说明. "小"的Unicode码的二进制表示为101110000001111. 按照上文明中UTF-8的编码规则, "小"的UTF-8的编码值为0xE5B08F, UTF-16的编码值为0x5C0F, UTF-32的编码值为0x00005C0F  
* 获取小的Unicode值  
![](./images/encoding.png)

* 以UTF-8 without BOM格式保存的'小'字  
![](./images/UTF-8-no-bom.png)

* 以UTF-8 with BOM格式保存的'小'字  
![](./images/UTF-8-with-bom.png)

* 以UTF-16LE格式保存的'小'字
![](./images/UTF-16LE.png)

* 以UTF-16BE格式保存的'小'字
![](./images/UTF-16BE.png)

> 编码单元与编码单元在网络中传输的顺序是确定的.

#### 国标编码
前面所提到的编码格式, 无论是UTF-8, UTF-16还是UTF-32, 都是国际标准. 但是在这些国际标准出现之前, 计算机的发展也需要国内有自己的编码规范. 于是出现了我们熟知的GB2312, GBK以及不太熟悉的GB18030. 

##### [GB2312](https://zh.wikipedia.org/wiki/GB_2312)
又称GB2312-80或GB 0, 是中国国家标准简体中文字符集, 全称<b>《信息交换用汉字编码字符集·基本集》</b>, 由中国国家标准总局发布, 1981年5月1日实施. GB2312编码通行于中国大陆; 新加坡等地也采用此编码.  
GB2312标准共收录6763个汉字, 其中一级汉字(常用汉字)3755个, 二级汉字(非常用汉字)3008个; 同时收录了包括[拉丁字母](https://zh.wikipedia.org/wiki/%E6%8B%89%E4%B8%81%E5%AD%97%E6%AF%8D)、[希腊字母](https://zh.wikipedia.org/wiki/%E5%B8%8C%E8%85%8A%E5%AD%97%E6%AF%8D)、日文[平假名](https://zh.wikipedia.org/wiki/%E5%B9%B3%E5%81%87%E5%90%8D)及[片假名字母](https://zh.wikipedia.org/wiki/%E7%89%87%E5%81%87%E5%90%8D)、[俄语西里尔字母](https://zh.wikipedia.org/wiki/%E8%A5%BF%E9%87%8C%E5%B0%94%E5%AD%97%E6%AF%8D)在内的682个字符.

##### [GBK](https://zh.wikipedia.org/wiki/%E6%B1%89%E5%AD%97%E5%86%85%E7%A0%81%E6%89%A9%E5%B1%95%E8%A7%84%E8%8C%83)
GBK, 汉字内码扩展规范, 全名为《汉字内码扩展规范(GBK)》1.0版, 英文全称Chinese Internal Code Extension Specification, 由中华人民共和国全国信息技术标准化技术委员会1995年12月1日制订. GBK共收录21886个汉字和图形符号, 其中汉字(包括部首和偏旁)21003个, 图形符号883个. GBK是对GB2312的扩展, 因此向下兼容GB2312. GBK只为“技术规范指导性文件”，不属于国家标准, 说它是国标是不准确的, 但是鉴于其使用的广泛性, 因此将其与其他两种编码放在一起进行说明.
>GBK, 国标扩展, 只是拼音首字母而已  

##### [GB18030](https://zh.wikipedia.org/wiki/GB_18030)
GB18030, 全称<b>国家标准GB 18030-2005《信息技术中文编码字符集》</b>, 是中华人民共和国现时最新的变长多字节字符集. 对GB2312完全向后兼容, 与GBK基本兼容.共收录汉字70224个. GB18030主要有以下特点:  
* 采用变长多字节编码, 每个字可以由1个、2个或4个字节组成.
* 编码空间庞大, 最多可定义161万个字符
* 支持中国国内少数民族文字, 不需要动用造字区
* 汉字收录范围包含繁体字以及日韩文字

以上面的"小"字为例, 使用GB2312、GBK或GB18030编码方式进行保存时, 存储的二进制值都是相同的, 均为0xD0A1  
* GB2312格式保存的"小"字  
![](./images/GB-2312.png)
* GBK格式保存的"小"字  
![](./images/GBK.png)
* GB18030格式保存的"小"字
![](./images/GB-18030.png)

#### 总结
这里只是介绍了一些最基础的东西, 在实际工作中可能你还会遇到诸如ANSI编码, 代码页等, 如果你想了解更多内容, 那就点<a href="https://www.google.com/ncr" target="_blank">这里</a>吧.  
由于能力有限, 有些地方可能说的并不清楚, 如果有什么问题, 可以在下方留言或者发邮件给<a href="mailto: lungern.site@gmail.com">我</a>.

#### 参考链接
1. [Unicode详解](https://charlee.li/unicode-intro.html)
2. [字节序](https://zh.wikipedia.org/wiki/%E5%AD%97%E8%8A%82%E5%BA%8F)
3. [UCS](https://en.wikipedia.org/wiki/Universal_Coded_Character_Set#Correlation_to_Unicode)
4. [unicode协会官方网站](https://unicode.org/)
5. [ISO](https://en.wikipedia.org/wiki/International_Organization_for_Standardization)
6. [Windows中的ANSI编码](https://www.zhihu.com/question/20650946)
7. [中文编码](https://www.zhihu.com/question/19677619)
8. [中文字符编码简介 GB2312/GBK/GB18030/BIG5](http://blog.csdn.net/liujinchengjx/article/details/1527909)