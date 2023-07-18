package com.dong.fileserver.service;

import com.dong.fileserver.entity.base.BaseAttachment;

/**
 * 附件
 *
 * @author liudong
 * @date 2023/7/18
 */
public interface AttachmentService {

    void put(String id, BaseAttachment attachment);

    <T extends BaseAttachment> T get(String id);

    void remove(String id);

    <T extends BaseAttachment> T take(String id);
}
