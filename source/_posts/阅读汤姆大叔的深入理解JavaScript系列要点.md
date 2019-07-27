---
title: 阅读汤姆大叔的深入理解JavaScript系列要点
date: 2019-05-25 13:49:54
tags: JavaScript
---

#### 系列1

###### 1、忘记var的副作用
* 通过var创建的全局变量（任何函数之外的程序中创建）是不能被删除的。
* 无var创建的隐式全局变量（无视是否在函数中创建）是能被删除的。

<!-- more -->

###### 2、访问全局对象

意思是统一全局对象的变量名
例如在开发js库的时候，不同的环境下，浏览器/Node，or 严格模式下能够统一通过使用相同的变量名访问全局对象。
```javascript
var global = (function() {
    return this
}());
```

###### 3、单var/let/const形式
在函数顶部是使用单个语句声明变量，好处在于：
* 易读
* 防止**变量提升**逻辑错误
* 少点代码

**变量提升**：
例子：

```javascript
function test() {
    console.log(global);// undefined
    var global = 'global';
    console.log(global); // global
}
test()

// 等价于：
function test1() {
    var global;
    console.log(global)
    var global = 'global';
    console.log(global); // global
}
test1()
/* 
* 原因：
* js解析器在解析阶段，把所有的声明提升到顶端后（hoisting）再执行。
* 文章中的“var散布的问题”有提及到
*/
```

###### 4、for循环
若使用for来循环DOM节点对象，最好是先声明DOM节点对象的长度。避免在每一次遍历过程都实时查询DOM，影响性能。

##### 5、for-in
for-in应该使用在非数组对象的遍历上，需要跟for-of区分开来，避免混淆
for-in另称为“枚举”
不推荐使用其遍历数组
for-in的属性遍顺序是不能保证的
for-in会枚举对象原型链上的属性，需要用hasOwnProperty()过滤
**（object.hasOwnProperty(object[key])）**

ps:
例子中使用了**Object.prototype.hasOwnProperty.call（man, i）**来过滤，而不直接选择**man.hasOwnProperty(i)**
查了一下资料说，

>如果使用 Object.create(null) 创建的对象是没有prototype的，所以是没有任何方法的，这种情况下，调用上述方法只会得到 undefined。

但我的疑问是，既然已经用了for-in进行枚举对象，那如果没有prototype的话，那就根本不用去过滤了，man这个对象就没有prototype，这不就多此一举了吗？
这是我不理解的地方。

###### 6、避免隐式类型转换

如题，在我接触的实际业务中，大部分都是出现在判断的情况下。
与其说尽量，还不如直接忘记“==”这个符号，之后都是用全等于“===”来进行判断，除非逼不得已。

###### 7、parseInt()

为了避免矛盾和意外的结果，总是指定基数参数。

[深入理解JavaScript系列（1）：编写高质量JavaScript代码的基本要点](https://www.cnblogs.com/TomXu/archive/2011/12/28/2286877.html)


#### 系列2

emmmm....系列二前面还好，后面越看越迷糊。之后有机会仔细再研究这个系列。


#### 系列3 全面解析Module模式

什么是Module模式，什么是模式。
由此引申出“设计模式”这个概念
参考：[什么是设计模式？](https://www.kancloud.cn/kancloud/learn-js-design-patterns/56469"%3Ehttps://www.kancloud.cn/kancloud/learn-js-design-patterns/56469%3C)

而Module模式，则是设计模式中“模块化模式”中的一种。
详细需要[链接](https://www.kancloud.cn/kancloud/learn-js-design-patterns/56469"%3Ehttps://www.kancloud.cn/kancloud/learn-js-design-patterns/56469%3C)

往后 大叔系列25-系列44都需要参考各样的资料。
“模式”的概念对于我来说现阶段较为庞大，后续再去深入理解。


#### 系列4 立即调用的函数表达式

```javascript

（function () { /* do something */ }()） // TOM大叔推荐写法

```

我认为，在实际工作中只需要明白**立即调研的函数表达式**主要的作用/目的：
首先看一个例子
```javascript

(funcition () { var a = 1; b = function () { console.log(a) } })
a // a is not defined
b() // 1

```

上面的例子中，表达式a变成局部变量，形成闭包，只有调用b函数才能访问变量a。
这样隔断了作用域，防止了变量名的污染。

实际应用：
参考：[自执行函数引用](https://www.cnblogs.com/teamobaby/p/4000618.html)

#### 系列5 原型和原型链

待定。

