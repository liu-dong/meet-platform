package com.dong.fileserver.service;

/**
 * @author liudong
 * @date 2023/7/18
 */
public interface CacheService {

    void put(String key, Object value);

    <T> T get(String key);

    void remove(String key);

    void removeAll();

}
