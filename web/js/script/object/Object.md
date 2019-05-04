## [Object.create()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/create)
__Object.create()__ 方法用来创建一个新对象, 使用现有的对象来提供新创建的对象的 __proto__.
```
Object.create(proto, [propertiesObject])
```
### 参数

1. __proto__  
新创建对象的原型对象
2. __propertiesObject__  
可选. 如果没有指定为undefined, 则是要添加到新创建对象的可枚举属性(即其自身定义的属性, 而不是其原型链上的枚举属性)对象的属性描述符以及相对应的属性名称. 这些属性对应Object.defineProperties()的第二个参数

### 返回值
一个新对象, 带着指定的原型对象和属性

### 例外
如果 __propertiesObject__ 参数是null或非原始包装对象, 则抛出一个 __TypeError__ 异常

# #
## [Object.assign()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/assign)
__Object.assign()__ 方法用于将所有可枚举属性的值从一个或多个源对象复制到目标对象. 它将返回目标对象. 如果目标对象中的属性具有相同的键, 则属性将被源对象中的属性覆盖. 后面的源对象的属性将类似地覆盖前面的源对象的属性. 该方法使用源对象的[[Get]]和目标对象的[[Set]], 所以它会调用相关getter和setter. 因此, 它分配属性, 而不仅仅是复制或定义新的属性. 在出现错误的情况下, 例如, 如果属性不可写, 会引发 __TypeError__, 如果在引发错误之前添加了任何属性, 则可以更改 __target__ 对象. 
```
Object.assign(target, ...sources)
```
### 参数
1. __target__  
目标对象
2. __sources__
源对象

### 返回值
目标对象