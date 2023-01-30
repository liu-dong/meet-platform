package com.dong.cacheserver;

import cn.hutool.core.lang.Assert;
import com.dong.cacheserver.config.CacheBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@SpringBootTest
class SpringbootCacheApplicationTests {

    @Resource
    private CacheBuilder cacheBuilder;

    @Test
    void contextLoads() {
    }

    @Test
    public void testCacheVersion() throws Exception {

        String version = cacheBuilder.getCacheVersion();
        System.out.println(String.format("当前缓存版本：%s", version));

        String cacheKey = cacheBuilder.generateVerKey("goods778899");

        Map<String, Object> goodsVO = new HashMap<>();
        goodsVO.put("GoodsId", UUID.randomUUID().toString());

        goodsVO.put("GoodsType", 1024);
        goodsVO.put("GoodsCode", "123456789");
        goodsVO.put("GoodsName", "我的测试商品");

        cacheBuilder.set(cacheKey, goodsVO);

        Map<String, Object> goodsVO1 = cacheBuilder.get(cacheKey);


        version = cacheBuilder.resetCacheVersion();
        System.out.println(String.format("重置后的缓存版本：%s", version));


        cacheKey = cacheBuilder.generateVerKey("goods112233");

        cacheBuilder.set(cacheKey, goodsVO);

        Map<String, Object> goodsVO2 = cacheBuilder.get(cacheKey);

        Assert.notNull(goodsVO2);

        Assert.isTrue(goodsVO1.get("GoodsId").equals(goodsVO2.get("GoodsId")), "两个缓存对象的主键相同");
    }
}
