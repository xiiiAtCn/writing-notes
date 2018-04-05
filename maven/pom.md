pom.xml可以说是maven的核心. 关于项目的配置几乎都是定义在pom.xml中的. 基本上除了在最初创建项目的时候需要对它进行比较大的改动之外, 以后基本都不会有什么大的变动. 但是, 如果希望使用maven中的一些少用的特性的话, 那么对pom文件中的配置项有一个详细的了解是必不可少的. 虽然这种操作比较费时, 但是对于我们了解其一些默认特性, 对其进行个性化的改造, 以及了解大型软件的构建模式都是十分有帮助的.

#### 前言
本文基本上就是对maven官方文档的翻译, 不过会添加一些自己的理解. 虽然这中工作看起来可能会比较枯燥, 比较低效, 但这也是一个理解学习的过程. 如果你想看官方原版, 那么请点击[这里](https://maven.apache.org/ref/3.5.3/maven-model/maven.html); 如果对于我的翻译有什么意见或建议, 请发邮件给[我](mailto:lungern.site@gmail.com).

#### 根元素project
元素project是pom.xml的根元素, 在这个根元素下, 还包含了若干的子元素. 有些元素是对项目的描述, 但还有一些则是构建工程时必不可少的. 以下表格将会一一对这些子元素进行说明.
|元素|类型|描述|
|---|---|---|
|modelVersion|String|声明项目所使用的pom的主版本|
|parent|Parent|如果这个项目存在父工程的话, 则指明父工程的位置. 如果那些从父工程继承来的值没有重新指定, 那么将会使用父工程中定义的值作为默认值. 通过组ID, 工程ID, 工程版本号来指出父工程的位置|
|groupId|String|组id, 独一无二, 避免与其他工程重复|
|artifactId|String|产物id, 与组id放在一起时独一无二, 避免与其他工程下的产物重复|
|version|String|当前工程的版本号|
|packaging|String|工程产物的打包类型, 可以时jar, war, ear, pom. 插件可以创建它们自己的打包, 所以也会有它们自己的打包类型. 默认值时jar |
|name|String|工程全称|
|description|String|工程的详细描述, 当maven需要用来描述这个工程时会用到. 元素内的值可以使用CDATA包裹, 使得可以嵌入描述的html版本. 不建议用纯文本.|
|url|String|工程主页的链接. 默认值: 父工程url值 + 路径分隔符 + artifactId或者project.directory属性|
|inceptionYear|String|项目创建的年份. 用4位数表示. 生成版权条款时会用到|
|organization|Organization|工程所属的组织的信息|
|licenses/licence|List<License>|此工程的所有许可协议. 每个许可协议都通过一个license标签来描述. 工程中应该仅仅列出适用于该工程的许可. 如果列出了多个许可, 用户可以选择仅选择其中的一种许可协议, 而不需要接受所有许可协议|
|developers/developer|List<Develpoer>|工程的提交者信息|
|contributors/contributor|List<Contributor>|工程中不是提交者的贡献者信息|
|mailingLists/mailingList|List<MailingList>|工程的邮箱信息|
|prerequisites|Prerequisites|构建工程的先决条件|
|modules/module|List<String>|作为工程的一部分的模块(或叫子工程). 所以模块通过相对路径来指定. 建议模块名和它的artifactId一致|
|scm|Scm|工程所使用的软件配置管理信息, 如Svn, Git|
|issueManagement|IssueManagement|工程的问题管理系统信息|
|ciManagement|CiManagement|工程的持续集成信息|
|distributionManagement|DistributionManagement|工程的发行信息|
|properties/key=value*|Properties|在POM文件全局使用, 作为硬编码的替换|
|dependencyManagement|DependencyManagement|项目中依赖的默认信息. 这些依赖信息并不会立即被解析. 只有当依赖中只指定了组Id和工程Id, 没有指定其他信息时, 应用这里定义的与之匹配的其他信息|
|dependencies/dependency|List<Depnedency>|描述了工程中所依赖的所有模块信息|
|repositories/repository|List<Repository>|提供依赖和扩展的远程仓库的信息|
|pluginRepositories/pluginRepository|List<Repository>|提供build和report插件的远程仓库信息|
|build|Build|构建工程的必需信息|
|reports|DOM|弃用: 被maven忽略|
|reporting|Reporting|这个元素内包含了report插件来生成产物的详细描述信息. 当执行mvn site时会执行这些插件|
|profiles/profile|List<Profile>|当在本地项目构建中激活时, 会更改构建流程|