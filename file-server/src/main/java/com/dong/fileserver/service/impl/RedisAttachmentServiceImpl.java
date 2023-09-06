package com.dong.fileserver.service.impl;

import com.dong.commoncore.constant.RedisCacheKeyConstant;
import com.dong.commoncore.constant.TimeConstant;
import com.dong.commoncore.entity.BaseAttachmentEntity;
import com.dong.commoncore.service.CacheService;
import com.dong.fileserver.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * redis缓存附件上传数据
 *
 * @author liudong
 * @date 2023/9/4
 */
@Service("redisAttachmentService")
public class RedisAttachmentServiceImpl implements AttachmentService {

    @Qualifier("redisCacheService")
    @Autowired
    CacheService redisCacheService;

    @Override
    public void put(String id, BaseAttachmentEntity attachment) {
        redisCacheService.put(RedisCacheKeyConstant.ATTACHMENT_PREFIX + id, attachment, TimeConstant.MINUTES_15);
    }

    @Override
    public <T extends BaseAttachmentEntity> T get(String id) {
        return redisCacheService.get(RedisCacheKeyConstant.ATTACHMENT_PREFIX + id);
    }

    @Override
    public void remove(String id) {
        redisCacheService.remove(RedisCacheKeyConstant.ATTACHMENT_PREFIX + id);
    }

    @Override
    public <T extends BaseAttachmentEntity> T take(String id) {
        T domain = redisCacheService.get(RedisCacheKeyConstant.ATTACHMENT_PREFIX + id);
        redisCacheService.remove(RedisCacheKeyConstant.ATTACHMENT_PREFIX + id);
        return domain;
    }
}
