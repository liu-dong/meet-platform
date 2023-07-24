package com.dong.fileserver.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author liudong
 * @date 2023/7/24
 */
@Configuration
public class RedisConnectionPool {

    private static final String REDIS_HOST = "localhost";
    private static final int REDIS_PORT = 6379;
    private static final int MAX_TOTAL = 128;
    private static final int MAX_IDLE = 128;
    private static final int MIN_IDLE = 16;
    private static final long MAX_WAIT_MILLIS = 5000;

    private static JedisPool jedisPool;

    static {
        HikariConfig config = new HikariConfig();
        config.setMaximumPoolSize(MAX_TOTAL);
        config.setMinimumIdle(MIN_IDLE);
        config.setMaxLifetime(1800000);
        config.setConnectionTimeout(MAX_WAIT_MILLIS);
        config.setPoolName("HikariCP");
        HikariDataSource dataSource = new HikariDataSource(config);
        jedisPool = new JedisPool(new JedisPoolConfig(), REDIS_HOST, REDIS_PORT, 5000, null, String.valueOf(dataSource));
    }

    public static JedisPool getJedisPool() {
        return jedisPool;
    }
}
