package com.dong.fileserver.service;


import com.dong.commoncore.entity.BaseAttachmentEntity;
import com.dong.fileserver.dao.BaseAttachmentRepository;

import java.util.List;

/**
 * 基础附件接口
 *
 * @author liudong
 * @date 2023/3/20
 */
public interface BaseAttachmentService<E extends BaseAttachmentEntity, R extends BaseAttachmentRepository<E>> {

    /**
     * 保存附件（上传至minio，路径保存至数据表中）
 *
     * @param relationId     关联业务id
     * @param relationModule 关联业务模块
     * @param attachmentIds  附件id
     * @param attachmentType 附件类型
     * @return
     */
    List<E> saveAttachment(String relationId, String relationModule, List<String> attachmentIds, String attachmentType);

    /**
     * 删除附件
     *
     * @param id
     */
    void remove(String id);

    /**
     * 根据业务id查询附件
     *
     * @param relationId
     * @return
     */
    List<E> findByRelationId(String relationId);

}
