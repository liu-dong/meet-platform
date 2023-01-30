package com.dong.cacheserver.constant;

public class CacheConstant {

    /**
     * 是否启用本地缓存
     */
    public static final String ENABLE_REDIS_CACHE = "enable.local.cache";
    /**
     * 是否启用Redis缓存
     */
    public static final String ENABLE_LOCAL_CACHE = "enable.redis.cache";

    public static final String BASE_PACKAGE_NAME = "";
    /**
     * 最大缓存时间 1天
     */
    public static final long CACHE_MAXIMUM_SIZE = 1 * 24 * 60 * 60 * 1000;

    /**
     * 缓存时间 5分钟
     */
    public static final long CACHE_MINUTE = 5 * 60 * 1000;

    public static final String CACHE_VERSION_KEY = "cache.version.key";
}
