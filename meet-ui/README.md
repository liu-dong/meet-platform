# meet-ui

> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).


## 学习笔记
    axios：ajax的更进一步封装。封装axios用了AOP切面编程的思想。
        axios.create ： 创建自定义axios 实例
        
    Function：一种类型，可以作为参数传递到方法中
    
    Function三种定义：
        1.函数声明语法定义
        2.函数表达式定义
        3.Function构造函数定义
        
        函数声明与函数表达式的区别
        
        　　解析器对这两种定义函数方法的解析是不一样的。解析器
        会将函数声明的函数优先解析，使其在代码执行前可用
        （函数声明提前）。而函数表达式会在执行到该行代码才会被
        解析。

    前端访问后端路由需要添加跨域配置
