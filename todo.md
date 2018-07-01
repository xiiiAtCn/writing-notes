 ### js函数内可直接获取自身引用

### 博客
1. https连接  DNS，明天处理
2. 反向代理
2. 后台管理系统(react+redux+react-router)
3. 主题修改
4. 在线md文件编辑, 实时预览, 提交
5. 测试环境搭建
6. webRTC
7. webGL

### 服务器系统
1. 博客系统
2. 后台管理系统
3. 日志系统

### 相关内容
1. 概率论
2. 数论

### 博客问题
1. 头像未更换
2. banner图片没有
3. 粒子背景图片太碍眼
4. 开机启动脚本未生效

### 作息表

### WebAPIs学习
### 阅读vue源码 12月11日

### 批处理命令
1. 获取运行环境的目录, %cd%或者!cd!
2. 获取文件所在目录, %~dp0

### 思考
想说话，却不知道这话能对谁说

### 文件服务器
文件上传    文件夹创建和遍历    文件操作


### 汇编中数据位置的表达
1. 立即数(idata): 对于直接包含在机器指令中的数据(执行前在CPU的指令缓冲器中)
2. 寄存器: 指令要处理的数据在寄存器中，在汇编指令中给出相应的寄存器名。
3. 段地址(SA)和偏移地址(EA): 指令要处理的数据在内存中，在汇编指令中可用[X]的格式给出EA，SA在某个寄存器中。

### 指令处理数据的长度
1. 通过寄存器名指明要处理的数据的尺寸
2. 在没有寄存器名存在的情况下，用操作符X ptr指明内存单元的长度，X在汇编指令中可以为word或byte
3. 其他方法: 有些指令默认了访问的是字单元还是字节单元。push [x]就不用指明访问的是字单元还是字节单元。因为push指令只进行字操作。

### npm查询模块可用版本
npm view <模块名> versions

### 媒体查询可以测试的特性
1. width: 视口宽度
2. height: 视口高度
3. device-width: 渲染表面的宽度(可以认为是设备屏幕的宽度)
4. device-height: 渲染表面的高度(可以认为是设备屏幕的高度)
5. orientation: 设备方向是水平还是垂直
6. aspect-ratio: 视口的宽高比。16/9的宽屏显示器可以写成aspect-ratio:16/9
7. color: 颜色组分的位深。如min-color: 16表示设备至少支持16位深
8. color-index: 设备颜色查找表中的条目数，值必须是数值，且不能为负
9. monochrome: 单色帧缓冲中表示每个像素的位数，值必须是数值
10. resolution: 屏幕或打印分辨率。dpi或dpcm
11. scan: 针对电视的逐行扫描(progressive)和隔行扫描(interlace)
12. grid: 设备基于栅格还是位图  
除了scan和grid外，都可以加上min或max前缀以指定范围

### 网页大小随设备大小自动适应
    initial-size: 初始时内容的大小与实际大小的比例
    maximum(minimum)-scale: 页面可被放大或缩小的比例
    user-scalable: 允许或禁止用户缩放
    <meta name="viewport" content="initial-scale=1.0, width=device-width"/>

### flex属性
> flex 1 1 100px
1. flex-grow: 传给flex的第一个值，是相对于其他伸缩项，当前伸缩项在空间允许的情况下可以伸展的量
2. flex-shrink: 在空间不够的情况下，当前伸缩项相对于其他伸缩项可以收缩的量
3. flex-basis: 是伸缩项伸缩的基准值

### flex改变顺序
order属性: -1表示要位于其他所有元素之前

### 响应式图片
1. 通过srcset切换分辨率
    <img src="demo.jpg" alt="demo" srcset="demo_medium.jpg 1.5x, demo_large.jpg 2x">
2. srcset及sizes联合切换
    <img src="demo_small.jpg" srcset="demo_small.jpg 450w, demo_medium.jpg 900w" sizes="(min-width: 17em) 100vw, (min-width: 40em) 50vw"  alt="demo">
    使用w后缀的值对引入sizes属性非常重要。通过后者可以把意图传递给浏览器。
3. picture元素
    <picture>
        <source media="(min-width: 30em)" srcset="cake-table.jpg">
        <source media="(min-width: 60em)" srcset="cake-shop.jpg">
        <img src="cake.jpg" alt="cake">
    </picture>
    img标签是浏览器不支持picture元素，或者支持picture但没有合适媒体定义时的后备。

### 思考
对这个没有信心了

### 远程开机 自动开机
1. ddns
2. 端口转发
3. wireshark

### svg画一个钟表

### 文件上传到服务器之后文件名乱码

### request增加对其他hhtp请求的支持

### linux上挂载磁盘

### 迅雷链接解密

### base64编码

### ip伪造

### 智能合约 底层链

### ubuntu上安装jdk
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

### ubuntu安装nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs

### css中的百分比值

#### 支持百分比值的属性
* width: 用百分比来定义宽度。百分比参照包含块宽度。不允许负值
* min-width: 用百分比来定义最小宽度, 百分比参照包含块宽度。不允许负值
* max-width: 用百分比来定义最大宽度, 百分比参照包含块宽度。不允许负值
* height: 用百分比来定义高度, 百分比参照包含块高度。不允许负值
* min-height: 用百分比来定义高度, 百分比参照包含块高度。不允许负值
* max-height: 用百分比来定义高度, 百分比参照包含块高度。不允许负值
* padding: 水平书写模式下, 参照其包含块的width进行计算, 其他情况参照height, 可以为负值
* margin: 水平书写模式下, 参照其包含块的width进行计算, 其他情况参照height, 可以为负值
* border-radius: 用百分比定义圆形半径或椭圆的半长轴, 半短轴. 水平方向百分比参照元素宽度(非内容宽度), 垂直方向参照元素高度. 不允许负值.
* border-image-slice: 用百分比指定图像分割的位置. 垂直和水平方向的百分比分别参照图片的宽和高进行换算, 不允许负值.
### white-space word-wrap word-break text-overflo

### chrome插件--一键下载页面中的所有内容
1. 支持对html的下载
2. 支持对静态文件的下载
3. 支持目录层级及静态资源路径替换
4. css文件中的静态资源下载