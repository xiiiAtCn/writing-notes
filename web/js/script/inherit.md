# JS继承

## 原型链继承
```js
function Parent (name, age) {
    this.name = name
    this.age = age
}

function Child (name) {
    this.name = name
}
Child.prototype = new Parent('father', 35)
Child.prototype.constructor = Child

let child = new Child('son')

console.log(child.name, child.age) // son 35
```
### 特点
子类的 _prototype_ 属性指向父类的一个实例

### 优点
简单易于实现

### 缺点
1. 父类引用类型的属性会被所有子类实例共享
```js
function Parent () {
    this.siblings = ['Jane', 'Mike']
}

function Child () {
}

Child.prototype = new Parent()
Child.prototype.constructor = Child

let child1 = new Child()

child1.siblings.push('David')

console.log(child1.siblings) // ['Jane', 'Mike', 'David']

let child2 = new Child()

console.log(child2.siblings) // ['Jane', 'Mike', 'David']
```
2. 无法实现多继承
3. 创建子类实例时, 不能向父类构造函数中传递参数

## 借用构造函数继承(经典继承)
```js
function Parent () {
    this.siblings = ['Jane', 'Mike']
}

function Child () {
    Parent.call(this)
}

let child2 = new Child()
child2.siblings.push('David')
console.log(child2.siblings) // ['Jane', 'Mike', 'David']

let child = new Child()
console.log(child.siblings) // ['Jane', 'Mike']
```
### 优点
1. 避免了父类引用类型的属性被所有子类实例共享
2. 可以在子类构造函数中向父类构造函数传递参数
3. 可以实现多继承  
总结起来, 就是克服了上一种继承方式导致的问题

### 缺点
1. 方法都在构造函数中定义，每次创建实例都会创建一遍方法, 无法实现方法的复用
2. 子类原型为普通对象, 无法继承父类原型上的属性和方法. 
```js
// 接上
child instanceof Child
// true
child instanceof Parent
// false
child instanceof Object
// true
Child.prototype
/**
 * 
    {constructor: ƒ}
    constructor: ƒ Child()
    _proto_: Object
**/
```

## 组合继承
原型链继承和经典继承的结合. 使用原型链实现对原型属性和方法的继承, 而通过借用构造函数来实现对实例属性的继承.
```js
function Parent (name, siblings) {
    this.name = name
    this.siblings = ['Jane', 'Mike']
}

Parent.prototype.getSiblings = function () {
    console.log(this.siblings)
}

function Child (name, age, siblings) {
    Parent.call(this, name, siblings)
    this.age = age
}

Child.prototype = new Parent()
Child.prototype.constructor = Child

let child = new Child('David', 18, ['Jane', 'Mike'])
console.log(child.name) // David
console.log(child.age) // 18
console.log(child.getSiblings()) // ['Jane', 'Mike']

let child2 = new Child('Steven', 20, ['Jane', 'Mike'])
child2.siblings.push('David')
console.log(child2.name) // Steven
console.log(child2.age) // 20
console.log(child2.siblings) // ['Jane', 'Mike', 'David']
```
### 优点
1. 延续了经典继承的优点, 同时通过构造函数继承, 弥补了经典继承的缺点
### 缺点
在组合继承中父类的构造函数会被调用两次: 一次是创建子类型的时候, 另一次是在创建子类型构造函数的内部.
### 延伸
第一次调用父类构造函数时不需要函数内部的实例属性, 而只是想要获得父类原型上的方法. 所以, 可能希望直接这么写:
```js
Child.prototype = Parent.prototype
```
如果方法是定义在构造函数中时, 这么写问题不大, 但当在子类的原型上定义方法时, 则会遇到以下的问题.
1. 这样写相当于子类和父类的原型都指向同一个对象, 这时候如果添加了新的方法给 _Child_ 但实际上 _Parent_ 并不需要, 相当于强行给 _Parent_ 添加了一个未知的方法.
2. 这样体现不出继承的多态性. 比如子类想要重写父类的 _getName_ 的方法, 那么父类的方法也就会随之修改, 这显然违背了多态性.

## 原型式继承
```js
function createObj(o) {
    function F() {}
    F.prototype = o
    return new F()
}
```
即 _Object.create_ 的模拟实现, 将传入的对象作为创建的对象的原型

### 缺点
包含引用类型的属性值始终会共享相应的值, 这点跟原型链继承一样

## 寄生式继承
创建一个仅用于封装继承过程的函数，该函数在内部以某种方式来增强对象，最后再像真地是它做了所有工作一样返回对象.
```js
// 接上
function createObj1 (o) {
    var clone = createObj(o)
    clone.sayName = function () {
        console.log(this.name)
    }
    return clone
}
```
### 缺点
1. 跟借用构造函数模式一样, 每次创建对象都会创建一遍方法
2. 跟原型链继承一样, 包含引用类型的属性值始终会共享相应的值

## 寄生组合式继承
从原型式继承中可以看出, 在创建对象时, 并非调用了传入对象的构造函数, 而是F的构造函数, 这就能弥补组合继承两次调用父类构造函数的问题. 于是, 结合寄生式继承和组合继承, 就得到了 _JavaScript_ 中最理想的继承方式: 寄生组合式继承.
```js

function createObj(o) {
    function F() {}
    F.prototype = o
    return new F()
}

function Parent (name, siblings) {
    this.name = name
    this.siblings = ['Jane', 'Mike']
}

Parent.prototype.getSiblings = function () {
    console.log(this.siblings)
}

function Child (name, age, siblings) {
    Parent.call(this, name, siblings)
    this.age = age
}

// Child.prototype = new Parent()
Child.prototype = createObj(Parent)
Child.prototype.constructor = Child

let child = new Child('David', 18, ['Jane', 'Mike'])
console.log(child.name) // David
console.log(child.age) // 18
console.log(child.getSiblings()) // ['Jane', 'Mike']

let child2 = new Child('Steven', 20, ['Jane', 'Mike'])
child2.siblings.push('David')
console.log(child2.name) // Steven
console.log(child2.age) // 20
console.log(child2.siblings) // ['Jane', 'Mike', 'David']
```
## ES6 class
_ECMAScript 2015_ 中引入的 _JavaScript_ 类实质上是 _JavaScript_ 现有的基于原型的继承的语法糖。类语法不会为 _JavaScript_ 引入新的面向对象的继承模型。
```js
class Parent {
    constructor (name) {
        this.name = name
    }

    sayName () {
        console.log(this.name)
    }
}

class Child extends Parent {
    constructor (name, age) {
        super(name)
        this.age = age
    }
}

let child = new Child('David', 18)
console.log(child.sayName()) // David

```

### 参考链接
1. [JavaScript深入之继承的多种方式和优缺点](https://github.com/mqyqingfeng/Blog/issues/16)
2. [js继承的几种方式](https://zhuanlan.zhihu.com/p/37735247)
3. [30 分钟学会 JS 继承](https://zhuanlan.zhihu.com/p/25578222)
4. [类](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Classes)

