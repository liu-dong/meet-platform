package com.dong.fileserver.service;

import com.dong.commoncore.entity.BaseAttachmentEntity;

/**
 * 附件
 *
 * @author liudong
 * @date 2023/7/18
 */
public interface AttachmentService {

    void put(String id, BaseAttachmentEntity attachment);

    <T extends BaseAttachmentEntity> T get(String id);

    void remove(String id);

    <T extends BaseAttachmentEntity> T take(String id);
}
