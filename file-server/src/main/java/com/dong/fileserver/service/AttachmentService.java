package com.dong.fileserver.service;

import com.dong.commoncore.entity.BaseAttachmentEntityEntity;

/**
 * 附件
 *
 * @author liudong
 * @date 2023/7/18
 */
public interface AttachmentService {

    /**
     * 添加附件
     * @param id
     * @param attachment
     */
    void put(String id, BaseAttachmentEntityEntity attachment);

    /**
     * 获取附件
     *
     * @param id
     * @return
     * @param <T>
     */
    <T extends BaseAttachmentEntityEntity> T get(String id);

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
     * @return
     * @param <T>
     */
    <T extends BaseAttachmentEntityEntity> T take(String id);
}
