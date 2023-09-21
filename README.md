## 一、端口号

#### web(8080—8099)

    ·meet-ui(8080)：前端代码
    ·admin-ui(8081)：后台管理前端
    ·billing-ui(8082)：记账服务前端

#### Server(8180—8199)

    ·auth-server(8180)：认证服务
    ·admin-server(8181)：后台管理
    ·log-server(8182)：日志管理
    ·generator-server(8183)：代码生成
    ·common-server(8184)：公共模块
    ·message-server(8185)：消息服务

#### Service(8280—8299)

    ·billing-service(8280)：记账服务
    ·warehouse-service(8281)：库存系统
    ·product-service(8282)：商品系统
    ·order-service(8283)：订单系统

    ·chat-service(8284)：群聊管理
    ·event-service(8285)：事件处置

    ·ticket-service(8087)：操作票管理服务

## 二、项目模块

### 基础代码

    模块名称：common-core

    包含内容：全局常量，全局配置，通用工具类，通用对象

### 文件系统

    模块名称：file-server

    包含内容：alibaba-oss(已完成)，minio(已完成)，普通上传下载(已完成)，excel导入导出

### 消息系统

    模块名称：message-server

    包含内容：消息中间件（kafka、rabbitmq）,发送短信，发送邮件

### 数据处理服务

    模块名称：data-processing-server

    包含内容：数据同步，数据迁移，数据处理

### 日志管理系统

    模块名称：log-server
    
    包含内容：日志收集、日志分析

### 后台管理系统

    模块名称：admin-server
    
    包含内容：角色管理，权限管理，账号管理，数据字典管理

### 账号认证系统

    模块名称：auth-server
    
    包含内容：登录认证，单点登录

## 三、设计规范说明
    1、配置文件格式统一采用yml
    2、业务服务命名为xx-service、其他服务命名为xx-server
    4、 README.md中为项目的学习总结、学习目标、学习笔记等信息,
        IDEA.md为项目的设计思路、业务设计、开发计划等信息，
        HEPL.md为项目的启动说明，包括启动的先后顺序、启动的脚步以及注意点信息。
        PROBLEM.md为项目开发过程遇到问题，难点等信息
    5、使用框架选型统一使用springcloud全家桶
    6、端口号分配
        前端：8080
        业务服务：8081、8082、8083(负载均衡：8091、8092、8093)
        服务注册中心：8180、8181、8182（集群端口）
        负载均衡：8280
        服务容错：8380
        服务网关：8480
        服务认证：8580
        。
        。
        。
    7、增删改查命名规则
        ·查询列表：findObjectList
        ·查询单个对象：getObjectDetail
        ·保存：saveObject
        ·删除：deleteOject
        ·查询中间表：findTable1Table2InfoList        
        
    8、数据库规则
        ·业务表需包含创建人创建时间修改人修改时间
        ·中间表需包含创建时间修改时间
  
    9、不配置根路径

    10、采用redis配置数据字典，设置规范：
        1、放在dictionary下面
        2、分模块添加数据字典
            后台管理模块
                dictionary:admin
            订单管理模块
                dictionary:order
        3、在公共模块维护数据字典功能
        4、把每次的添加数据和删除数据的脚本持久化
        5、命名规则：同一模块下用:半角冒号隔开，命名含义多个单词由.半角句号隔开
    11、前端规范
        1、api与view模块对应
        2、components放置全局组件，各业务组件放置在业务模块下

    12、提交规范
        【模块名称】
        修改内容：1、****

    13、git管理
        每学习一个微服务组件切一个分支
        每增加一个具体功能切一个分支

    14、文档管理
        父工程下写组件大概的作用，及使用配置，操作步骤等
        子工程下写组件详细使用，如安装教程，注解说明等
