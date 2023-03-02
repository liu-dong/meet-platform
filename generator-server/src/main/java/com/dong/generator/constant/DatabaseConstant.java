package com.dong.generator.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liudong
 * @date 2023/3/2
 */
public class DatabaseConstant {

    /**
     * 前缀
     */
    public static final String JDBC_URL_PREFIX = "jdbc:mysql://";

    /**
     * 后缀
     */
    public static final String JDBC_URL_SUFFIX = "?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8&useSSL=false";

    /**
     * druid连接池属性
     */
    public static final Map<String, String> DRUID_PROPERTIES = new HashMap<String, String>() {{
        put("type", "com.alibaba.druid.pool.DruidDataSource");
        put("driverClassName", "com.mysql.jdbc.Driver");
        put("url", "jdbc:mysql://192.168.154.127:3306?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8&useSSL=false");
        put("username", "root");
        put("password", "123456");

        put("initialSize", "1");
        put("maxActive", "100");
        put("minIdle", "1");
        put("maxWait", "60000");
        put("timeBetweenEvictionRunsMillis", "60000");
        put("minEvictableIdleTimeMillis", "300000");
        put("validationQuery", "select 'x'");
        put("testWhileIdle", "true");
        put("testOnBorrow", "false");
        put("testOnReturn", "false");
        put("poolPreparedStatements", "true");
        put("maxOpenPreparedStatements", "50");
        put("maxPoolPreparedStatementPerConnectionSize", "20");

    }};
}
