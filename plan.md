# 项目规划

## 一、项目模块

### 基础代码
    模块名称：common-core

    包含内容：全局常量，全局配置，通用工具类，通用对象

### 文件系统
    模块名称：file-server

    包含内容：alibaba-oss，minio，普通上传下载，excel导入导出

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