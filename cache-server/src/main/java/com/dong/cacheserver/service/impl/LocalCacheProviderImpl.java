package com.dong.cacheserver.service.impl;

import com.dong.cacheserver.constant.CacheConstant;
import com.dong.cacheserver.service.CacheProviderService;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.function.Function;

/*
 * 本地缓存提供者服务 (Guava Cache)
 * */
@Configuration
@ComponentScan(basePackages = CacheConstant.BASE_PACKAGE_NAME)
@Qualifier("localCacheService")
public class LocalCacheProviderImpl implements CacheProviderService {

    private static final Map<String, Cache<String, Object>> CACHE_MAP = Maps.newConcurrentMap();

    static {

        Cache<String, Object> cacheContainer = CacheBuilder.newBuilder()
                .maximumSize(CacheConstant.CACHE_MAXIMUM_SIZE)
                .expireAfterWrite(CacheConstant.CACHE_MINUTE, TimeUnit.MILLISECONDS)//最后一次写入后的一段时间移出
                //.expireAfterAccess(CacheConstant.CACHE_MINUTE, TimeUnit.MILLISECONDS) //最后一次访问后的一段时间移出
                .recordStats()//开启统计功能
                .build();

        CACHE_MAP.put(String.valueOf(CacheConstant.CACHE_MINUTE), cacheContainer);
    }

    /**
     * 查询缓存
     *
     * @param key 缓存键 不可为空
     **/
    public <T extends Object> T get(String key) {
        T obj = get(key, null, null, CacheConstant.CACHE_MINUTE);

        return obj;
    }

    /**
     * 查询缓存
     *
     * @param key      缓存键 不可为空
     * @param function 如没有缓存，调用该callable函数返回对象 可为空
     **/
    public <T extends Object> T get(String key, Function<String, T> function) {
        T obj = get(key, function, key, CacheConstant.CACHE_MINUTE);

        return obj;
    }

    /**
     * 查询缓存
     *
     * @param key      缓存键 不可为空
     * @param function 如没有缓存，调用该callable函数返回对象 可为空
     * @param funcParm function函数的调用参数
     **/
    public <T extends Object, M extends Object> T get(String key, Function<M, T> function, M funcParm) {
        T obj = get(key, function, funcParm, CacheConstant.CACHE_MINUTE);

        return obj;
    }

    /**
     * 查询缓存
     *
     * @param key        缓存键 不可为空
     * @param function   如没有缓存，调用该callable函数返回对象 可为空
     * @param expireTime 过期时间（单位：毫秒） 可为空
     **/
    public <T extends Object> T get(String key, Function<String, T> function, Long expireTime) {
        T obj = get(key, function, key, expireTime);

        return obj;
    }

    /**
     * 查询缓存
     *
     * @param key        缓存键 不可为空
     * @param function   如没有缓存，调用该callable函数返回对象 可为空
     * @param funcParm   function函数的调用参数
     * @param expireTime 过期时间（单位：毫秒） 可为空
     **/
    public <T extends Object, M extends Object> T get(String key, Function<M, T> function, M funcParm, Long expireTime) {
        T obj = null;
        if (StringUtils.isEmpty(key) == true) {
            return obj;
        }

        expireTime = getExpireTime(expireTime);

        Cache<String, Object> cacheContainer = getCacheContainer(expireTime);

        try {
            if (function == null) {
                obj = (T) cacheContainer.getIfPresent(key);
            } else {
                final Long cachedTime = expireTime;
                obj = (T) cacheContainer.get(key, () -> {
                    T retObj = function.apply(funcParm);
                    return retObj;
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return obj;
    }

    /**
     * 设置缓存键值 直接向缓存中插入值，这会直接覆盖掉给定键之前映射的值
     *
     * @param key 缓存键 不可为空
     * @param obj 缓存值 不可为空
     **/
    public <T extends Object> void set(String key, T obj) {

        set(key, obj, CacheConstant.CACHE_MINUTE);
    }

    /**
     * 设置缓存键值 直接向缓存中插入值，这会直接覆盖掉给定键之前映射的值
     *
     * @param key        缓存键 不可为空
     * @param obj        缓存值 不可为空
     * @param expireTime 过期时间（单位：毫秒） 可为空
     **/
    public <T extends Object> void set(String key, T obj, Long expireTime) {
        if (StringUtils.isEmpty(key) == true) {
            return;
        }

        if (obj == null) {
            return;
        }

        expireTime = getExpireTime(expireTime);

        Cache<String, Object> cacheContainer = getCacheContainer(expireTime);

        cacheContainer.put(key, obj);
    }

    /**
     * 移除缓存
     *
     * @param key 缓存键 不可为空
     **/
    public void remove(String key) {
        if (StringUtils.isEmpty(key) == true) {
            return;
        }

        long expireTime = getExpireTime(CacheConstant.CACHE_MINUTE);

        Cache<String, Object> cacheContainer = getCacheContainer(expireTime);

        cacheContainer.invalidate(key);
    }

    /**
     * 是否存在缓存
     *
     * @param key 缓存键 不可为空
     **/
    public boolean contains(String key) {
        boolean exists = false;
        if (StringUtils.isEmpty(key) == true) {
            return exists;
        }

        Object obj = get(key);

        if (obj != null) {
            exists = true;
        }

        return exists;
    }

    private static Lock lock = new ReentrantLock();

    private Cache<String, Object> getCacheContainer(Long expireTime) {

        Cache<String, Object> cacheContainer = null;
        if (expireTime == null) {
            return cacheContainer;
        }

        String mapKey = String.valueOf(expireTime);

        if (CACHE_MAP.containsKey(mapKey) == true) {
            cacheContainer = CACHE_MAP.get(mapKey);
            return cacheContainer;
        }

        try {
            lock.lock();
            cacheContainer = CacheBuilder.newBuilder()
                    .maximumSize(CacheConstant.CACHE_MAXIMUM_SIZE)
                    .expireAfterWrite(expireTime, TimeUnit.MILLISECONDS)//最后一次写入后的一段时间移出
                    //.expireAfterAccess(CacheConstant.CACHE_MINUTE, TimeUnit.MILLISECONDS) //最后一次访问后的一段时间移出
                    .recordStats()//开启统计功能
                    .build();

            CACHE_MAP.put(mapKey, cacheContainer);

        } finally {
            lock.unlock();
        }

        return cacheContainer;
    }

    /**
     * 获取过期时间 单位：毫秒
     *
     * @param expireTime 传人的过期时间 单位毫秒 如小于1分钟，默认为10分钟
     **/
    private Long getExpireTime(Long expireTime) {
        Long result = expireTime;
        if (expireTime == null || expireTime < CacheConstant.CACHE_MINUTE / 10) {
            result = CacheConstant.CACHE_MINUTE;
        }

        return result;
    }
}
