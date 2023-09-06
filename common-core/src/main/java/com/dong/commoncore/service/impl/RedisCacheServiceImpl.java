package com.dong.commoncore.service.impl;

import com.dong.commoncore.config.JedisConnectionPool;
import com.dong.commoncore.constant.RedisCacheKeyConstant;
import com.dong.commoncore.constant.SymbolConstant;
import com.dong.commoncore.constant.TimeConstant;
import com.dong.commoncore.service.CacheService;
import com.dong.commoncore.util.ObjectUtils;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

/**
 * Redis缓存
 *
 * @author liudong
 * @date 2023/9/4
 */
@Service("redisCacheService")
public class RedisCacheServiceImpl implements CacheService {

    @Override
    public void put(String key, Object value, Long expireTime) {
        Jedis jedis = JedisConnectionPool.connJedis();
        try {
            jedis.set(key.getBytes(), ObjectUtils.serialize(value));
            if (expireTime == null) {
                //默认2小时失效
                jedis.pexpire(key.getBytes(), TimeConstant.HOURS_2);
            } else {
                jedis.pexpire(key.getBytes(), expireTime);
            }
        } finally {
            JedisConnectionPool.close(jedis);
        }
    }

    @Override
    public void put(String key, Object value) {
        Jedis jedis = JedisConnectionPool.connJedis();
        try {
            jedis.set(key.getBytes(), ObjectUtils.serialize(value));
            //默认2小时失效
            jedis.pexpire(key.getBytes(), TimeConstant.HOURS_2);
        } finally {
            JedisConnectionPool.close(jedis);
        }
    }

    @Override
    public <T> T get(String key) {
        Jedis jedis = JedisConnectionPool.connJedis();
        try {
            byte[] value = jedis.get(key.getBytes());
            if (value == null || value.length == 0) {
                return null;
            }
            return (T) ObjectUtils.deserialize(value);
        } finally {
            JedisConnectionPool.close(jedis);
        }
    }

    @Override
    public void remove(String key) {
        Jedis jedis = JedisConnectionPool.connJedis();
        try {
            jedis.del(key.getBytes());
        } finally {

            JedisConnectionPool.close(jedis);
        }
    }

    @Override
    public void removeAll() {
        Jedis jedis = JedisConnectionPool.connJedis();
        try {
            ScanParams scanParams = new ScanParams().match(RedisCacheKeyConstant.CACHE_PREFIX + SymbolConstant.ASTERISK);
            String cursor = ScanParams.SCAN_POINTER_START;
            do {
                ScanResult<String> scanResult = jedis.scan(cursor, scanParams);
                for (String key : scanResult.getResult()) {
                    jedis.del(key);
                }
                cursor = scanResult.getCursor();
            } while (!cursor.equals(ScanParams.SCAN_POINTER_START));
        } finally {
            JedisConnectionPool.close(jedis);
        }
    }
}
