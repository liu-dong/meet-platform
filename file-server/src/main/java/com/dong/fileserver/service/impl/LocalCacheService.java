package com.dong.fileserver.service.impl;

import com.dong.fileserver.service.CacheService;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author liudong
 * @date 2023/7/18
 */
@Service
public class LocalCacheService implements CacheService {

    private static final Map<String, Object> RESOURCE_MAP = new ConcurrentHashMap<>();

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
