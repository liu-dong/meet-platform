1、border: 1px solid red;(显示颜色加边框)
2、100vh代表屏幕的高、100vw代表屏幕的宽
3、<router-view/>路由引入的页面替换这个标签那里
4、flex布局：(容器和项目是相对的，外层的是容器、内层的为项目)
flex-direction：属性决定主轴的方向(即项目的排列方向)。(决定居左居右)
flex-wrap：如果一条轴线排不下，如何换行。(决定换行的方式)
flex-flow：flex-direction属性和flex-wrap属性的简写形式，默认值为row nowrap。(上两个属性的简写)
justify-content：属性定义了项目在主轴上的对齐方式。(里面内容左右对齐方式)
align-items：属性定义项目在交叉轴上如何对齐。(里面内容上下对齐方式)
align-content：属性定义了多根轴线的对齐方式。

5、<!--数值转字符串num + ''-->

6、测试模式下注释src\axios\index.js下一行代码
切换src\http\index.js下test模式（已废弃）

7、axios中params和data与post和get、@RequestBody和@RequestParam之间的对应关系

    1、get请求只能使用params，不能使用@RequestBody注解，所以不能使用data，params里面不能有对象
    2、post请求params、data都能使用，data里面可以包含对象，使用data后端则需要必须使用@RequestBody接受，
        如果使用params，后端不加注解的话会自动匹配同名参数。如果需要匹配特定参数则使用@RequestParams注解。
    3、params和data、@RequestBody和@RequestParams可以同时使用
