package com.dong.commoncore.config;

import lombok.Data;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Redis属性
 *
 * @author liudong
 * @date 2023/7/24
 */
@Data
@Component
@ConfigurationProperties(prefix = "spring.redis")
@EnableConfigurationProperties({RedisProperties.class})
public class RedisProperties implements InitializingBean {

    /**
     * Redis数据库索引（默认为0）
     */
    private String database;

    /**
     * Redis服务器地址
     */
    private String host;

    /**
     * Redis服务器端口
     */
    private Integer port;

    /**
     * Redis服务器密码（默认为空）
     */
    private String password;

    /**
     * Redis连接超时时间 默认：5分钟（单位：毫秒）
     */
    private Integer timeout;

    /**
     * Redis连接池最大连接数（使用负值表示没有限制）
     */
    private Integer jedisPoolMaxActive;

    /**
     * Redis连接池中的最小空闲连接
     */
    private Integer jedisPoolMinIdle;

    /**
     * Redis连接池中的最大空闲连接
     */
    private Integer jedisPoolMaxIdle;

    /**
     * Redis连接池最大阻塞等待时间（使用负值表示没有限制）
     */
    private Integer jedisPoolMaxWait;

    /**
     * Redis服务器地址
     */
    public static String HOST;

    /**
     * Redis服务器端口
     */
    public static Integer PORT;

    /**
     * Redis服务器密码（默认为空）
     */
    public static String PASSWORD;

    /**
     * Redis连接超时时间 默认：5分钟（单位：毫秒）
     */
    public static Integer TIMEOUT;

    /**
     * Redis连接池最大连接数（使用负值表示没有限制）
     */
    public static Integer JEDIS_POOL_MAX_ACTIVE;

    /**
     * Redis连接池中的最小空闲连接
     */
    public static Integer JEDIS_POOL_MIN_IDLE;

    /**
     * Redis连接池中的最大空闲连接
     */
    public static Integer JEDIS_POOL_MAX_IDLE;

    /**
     * Redis连接池最大阻塞等待时间（使用负值表示没有限制）
     */
    public static Integer JEDIS_POOL_MAX_WAIT;


    @Override
    public void afterPropertiesSet() {
        HOST = host;
        PORT = port;
        PASSWORD = password;
        TIMEOUT = timeout;
        JEDIS_POOL_MAX_ACTIVE = jedisPoolMaxActive;
        JEDIS_POOL_MIN_IDLE = jedisPoolMinIdle;
        JEDIS_POOL_MAX_IDLE = jedisPoolMaxIdle;
        JEDIS_POOL_MAX_WAIT = jedisPoolMaxWait;
    }
}
