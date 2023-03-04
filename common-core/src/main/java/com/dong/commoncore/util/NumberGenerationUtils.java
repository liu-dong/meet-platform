package com.dong.commoncore.util;

import redis.clients.jedis.Jedis;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @author LD
 * 公共工具类
 */
public class NumberGenerationUtils {

    /**
     * 获取32位无字母与数字组合的uuid
     *
     * @return
     */
    public static String getUUID() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-", "");
    }

    /**
     * 生成订单编号（yyyyMM0001）
     * 年月+数量递增（21010001）
     *
     * @return
     */
    public static String getOrderCode(String type) {
        Jedis jedis = RedisUtil.connRedis();
        String orderType = jedis.hget("order:type", type);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        String orderCode = sdf.format(new Date());
        Long maxNum = jedis.incrBy("order:code:" + type + ":" + orderCode, 1);
        return orderType.substring(0, 1) + "-" + orderCode + String.format("%04d", maxNum);
    }

    /**
     * 生成商品编号：
     * 书籍(BOOK)B-00001、
     * 服装(CLOTHING)C-00001、
     * 电子(DIGITAL)D-00001、
     * 其他(OTHER)O-00001
     *
     * @return
     */
    public static String getProductCode(String type) {
        Jedis jedis = RedisUtil.connRedis();
        String productType = jedis.hget("product:type", type);
        String productTypeCode = jedis.hget("product:type:code", productType);
        Long maxNum = jedis.incrBy("product:code:" + productTypeCode, 1);
        return productTypeCode + "-" + String.format("%05d", maxNum);
    }

    /**
     * 获得随机六位数
     *
     * @return
     */
    public static String getRandomSixNum() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }
}
