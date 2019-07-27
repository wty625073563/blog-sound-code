---
title: em 和 rem的区别，何时使用/实际应用
date: 2019-06-01 13:59:10
tags: CSS
---

### em 和 rem的区别，何时使用/实际应用。

网上有很多资料，此处只简要概括下和值得注意的地方

<!-- more -->

#### 1、区别

rem：
使用rem单位时，像素值根据根元素，即根**HTML**元素的字体大小决定
而当根**HTML**元素没有设置固定值去覆盖，那么字体大小首先来自**浏览器设置**。

E.g：
```css
html {
    font-size: 16px;
}
div {
    font-size: 1rem;
    border-size: 1rem;
    width: 1rem;
    ...
}
```

em：
使用em单位时，像素值将是**em值乘以使用em单位的元素**的字体大小

很多教程说是根据父元素决定，但其实不然；
之所以部分认为是父元素决定，是因为使用em单位的当前元素并没有设置像素值，需要去继承父元素，导致表象像是根据父元素的像素值大小而变化。

E.g：
```css
.parent {
    font-size: 15px;
}
.child1 {
    font-size: 1em;
}
.child2 {
    font-size: 20px;
    padding: 1em; /* 20px */
}
.child3 {
    font-size: 1.2em; /* 1.2 * 15px = 18px */
    padding: 1em; /* 18px */
}
```


#### 2、应用（建议）

文章中各有各的方法，此处只参考个人认为首选的方法。

1. 根据某个元素的字体大小做缩放而不是根元素的字体大小
2. 只在标识清楚的情况下使用em
3. 字体大小一般不适用em单位控制
4. 一切可扩展都应该使用rem单位
5. 媒体查询中使用rem单位
6. 多列布局中使用 %

其实以上几点都是互相影响，作用。
可以想象一个栗子

页面布局在组件化思维下：
一个组件在缩放时，应该根据当前组件的字体大小做缩放，所以在这种实际场景中，除了字体大小font-size这个属性外，其他例如，padding，margin等属性就需要使用em 单位。

而这时候的font-size属性需要rem 单位控制，当浏览器缩放时，根元素字体大小改变，对应组件字体大小改变，从而改变组件的ui布局。

更多详情可参考：
[综合指南: 何时使用 Em 与 Rem](https://webdesign.tutsplus.com/zh-hans/tutorials/comprehensive-guide-when-to-use-em-vs-rem--cms-23984)


