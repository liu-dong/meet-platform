package com.dong.commoncore.service.impl;

import com.dong.commoncore.service.CacheService;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 本地缓存
 *
 * @author liudong
 * @date 2023/9/6
 */
@Service("localCacheService")
public class LocalCacheServiceImpl implements CacheService {

    private static final Map<String, Object> RESOURCE_MAP = new ConcurrentHashMap<>();

    @Override
    public void put(String key, Object value, Long expireTime) {
        RESOURCE_MAP.put(key, value);
    }

    @Override
    public void put(String key, Object value) {
        RESOURCE_MAP.put(key, value);
    }

    @Override
    public <T> T get(String key) {
        return (T) RESOURCE_MAP.get(key);
    }

    @Override
    public void remove(String key) {
        RESOURCE_MAP.remove(key);
    }

    @Override
    public void removeAll() {
        RESOURCE_MAP.clear();
    }
}
