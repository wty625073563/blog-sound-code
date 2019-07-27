---
title: valueOf
date: 2019-05-05 23:48:18
tags: JavaScript
---

### valueOf

##### 描述

<!-- more -->

valueOf方法是将对象转换为“原始值”

默认情况下，valueOf方法由Object后面的每个对象继承。

如果对象没有原始值，则valueOf将返回对象本身。


| **对象** | **返回值** |
| --- | --- |
| **Array** | 返回数组对象本身 |
| **Boolean** | 布尔值 |
| **Date** | 存储的时间是从 1970 年 1 月 1 日午夜开始计的毫秒数 UTC。 |
| **Function** | 函数本身 |
| **Number** | 数值 |
| **Object** | 对象本身 |
| **String** | 字符串值 |
|  | Math 和 Error 对象没有valueOf方法 |


###### 什么是原始值

在ECMAScript中，变量可以存在两种**类型**的值，即原始值和引用值。

**原始值**
    存储在栈（stack）中的简单数据段，也就是说，他们的值直接存储在变量访问的位置。
    
**引用值**
    存储在堆（heap）中的对象，也就是说，存储在变量处的值是一个指针（point），指向存储对象的内存处。

<u>详细解释参考</u>[ECMAScript 原始值和引用值](http://www.w3school.com.cn/js/pro_js_value.asp)
    
![605dab694f82b63cc18932fd31dcc537.gif](en-resource://database/578:1)


> ECMAScript 6 引入了一种新的原始类型： **symbol** 。


###### 验证输出

```javascript
// Array
var ary = [1, 'a', function () { }]
var ary2 = ary.valueOf()
console.log( ary2 ) // [1, "a", f]
console.log( ary == ary2 ) // true
console.log( ary === ary2 ) // true

// Boolean
var bool = true
var bool2 = bool.valueOf()
// ...同上

// new Boolean
var bool3 = new Boolean(true)
var bool4 = bool3.valueOf()
console.log(bool3, bool4) // Boolean {true}, true
console.log(bool3 == bool4) // true
console.log(bool3 === bool4) // false

// Date
var date = new Date(2013, 7, 18, 23, 11, 59, 230);
console.log(date.valueOf());   // 1376838719230

// ... and so on
```

##### 延伸

近期看到的一道面试题：
```javascript

var result = +{
    a: 1,
    toString: function() { return '10' },
    valueOf: function () { return 100 }
}

console.log(result)

```
结果是 100
此处考点有对象的类型转化、toString() 和 valueOf() 调用的优先程度。