package com.dong.commoncore.config;

import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Jedis连接池
 *
 * @author liudong
 * @date 2023/7/24
 */
@Configuration
public class JedisConnectionPool {

    private static final JedisPool jedisPool;

    static {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(RedisProperties.JEDIS_POOL_MAX_ACTIVE);
        jedisPoolConfig.setMaxIdle(RedisProperties.JEDIS_POOL_MAX_IDLE);
        jedisPoolConfig.setMinIdle(RedisProperties.JEDIS_POOL_MIN_IDLE);
        jedisPool = new JedisPool(jedisPoolConfig, RedisProperties.HOST, RedisProperties.PORT, RedisProperties.TIMEOUT, null);
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
