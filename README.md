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

#### Service(8280—8299)

    ·billing-service(8280)：记账服务
    ·warehouse-service(8281)：库存系统
    ·product-service(8282)：商品系统
    ·order-service(8283)：订单系统
    ·ticket-service(8087)：操作票管理服务

## 二、项目模块

### 基础代码

    模块名称：common-core

    包含内容：全局常量，全局配置，通用工具类，通用对象

### 文件系统

    模块名称：file-server

    包含内容：alibaba-oss(已完成)，minio，普通上传下载(已完成)，excel导入导出

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
    
