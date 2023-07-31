package com.dong.fileserver.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.Jedis;
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
    private static final int MIN_IDLE = 16;
    private static final long MAX_WAIT_MILLIS = 5000;

    private static final JedisPool jedisPool;

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

    /**
     * 获取jedis连接
     *
     * @return
     */
    public static Jedis connJedis() {
        return jedisPool.getResource();
    }

    /**
     * 关闭连接
     *
     * @param jedis
     */
    public static void close(Jedis jedis) {
        jedisPool.returnResource(jedis);
    }
}
