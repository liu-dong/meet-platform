package com.dong.fileserver.service;

import com.dong.commoncore.entity.BaseAttachmentEntity;

/**
 * 附件
 *
 * @author liudong
 * @date 2023/7/18
 */
public interface AttachmentService {

    /**
     * 添加附件
     *
     * @param id
     * @param attachment
     */
    void put(String id, BaseAttachmentEntity attachment);

    /**
     * 获取附件
     *
     * @param id
     * @param <T>
     * @return
     */
    <T extends BaseAttachmentEntity> T get(String id);

    /**
     * 移除附件
     *
     * @param id
     */
    void remove(String id);

    /**
     * 提取附件（获取后移除）
     *
     * @param id
     * @param <T>
     * @return
     */
    <T extends BaseAttachmentEntity> T take(String id);
}
