package com.dong.commoncore.util;


import com.dong.commoncore.constant.CommonConstant;
import redis.clients.jedis.Jedis;

/**
 * @author LD
 */
public class RedisUtil {

    public static final String ADDRESS = "192.168.1.127";

    public static Jedis connRedis() {
        //连接本地的 Redis 服务
        Jedis jedis = new Jedis(ADDRESS);
        String ping = jedis.ping();
        if ("PONG".equals(ping)) {
            System.out.println("Redis连接成功！");
        }
        return jedis;
    }


    public static void set(String key, String value) {
        set(key, value, null);
    }

    /**
     * 添加字符串
     *
     * @param key
     * @param value
     * @param expire
     */
    public static void set(String key, String value, Integer expire) {
        Jedis jedis = RedisUtil.connRedis();
        jedis.set(key, value);
        if (expire != null) {
            jedis.expire(key, expire);
        }
    }

    public static String get(String key) {
        Jedis jedis = RedisUtil.connRedis();
        return jedis.get(key);
    }

    public static void del(String key) {
        Jedis jedis = RedisUtil.connRedis();
        jedis.del(key);
    }

    public static void main(String[] args) {
        RedisUtil.set(CommonConstant.EMAIL_CODE_PATH + ":964708273@qq.com", "20210111", 9000);
    }

    /*public static void main(String[] args) {
        Jedis jedis = connRedis();
        //连接本地的 Redis 服务
        String ping = jedis.ping();
        System.out.println(ping);
        // 如果 Redis 服务设置来密码，需要下面这行，没有就不需要
        // jedis.auth("123456");
        System.out.println("连接成功");
        //查看服务是否运行
        System.out.println("服务正在运行: "+jedis.ping());
        //设置 redis 字符串数据
        jedis.set("runoobkey", "www.runoob.com");
        // 获取存储的数据并输出
        System.out.println("redis 存储的字符串为: "+ jedis.get("runoobkey"));
        //存储数据到列表中
        jedis.lpush("site-list", "Runoob");
        jedis.lpush("site-list", "Google");
        jedis.lpush("site-list", "Taobao");
        // 获取存储的数据并输出
        List<String> list = jedis.lrange("site-list", 0 ,2);
        for (String s : list) {
            System.out.println("列表项为: " + s);
        }
        // 获取数据并输出
        Set<String> keys = jedis.keys("*");
        for (String key : keys) {
            System.out.println(key);
        }
    }*/
}
