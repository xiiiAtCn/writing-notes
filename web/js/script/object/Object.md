# Object.create()
Object.create()方法用来创建一个新对象, 使用现有的对象来提供新创建的对象的__proto__.
```
Object.create(proto, [propertiesObject])
```
## 参数

1. __proto__  
新创建对象的原型对象
2. __propertiesObject__  
可选. 如果没有指定为undefined, 则是要添加到新创建对象的可枚举属性(即其自身定义的属性, 而不是其原型链上的枚举属性)对象的属性描述符以及相对应的属性名称. 这些属性对应Object.defineProperties()的第二个参数