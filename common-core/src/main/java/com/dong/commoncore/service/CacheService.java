package com.dong.commoncore.service;

/**
 * 缓存
 *
 * @author liudong
 * @date 2023/9/6
 */
public interface CacheService {

    /**
     * 添加缓存
     *
     * @param key
     * @param value
     * @param expireTime 过期时间，单位毫秒
     */
    void put(String key, Object value, Long expireTime);

    /**
     * 添加缓存(默认15分钟)
     *
     * @param key
     * @param value
     */
    void put(String key, Object value);

    /**
     * 获取缓存
     *
     * @param key
     * @param <T>
     * @return
     */
    <T> T get(String key);

    /**
     * 删除指定缓存
     *
     * @param key
     */
    void remove(String key);

    /**
     * 删除所有缓存
     */
    void removeAll();

}
