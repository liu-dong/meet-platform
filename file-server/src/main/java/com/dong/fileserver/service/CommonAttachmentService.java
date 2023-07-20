package com.dong.fileserver.service;


import com.dong.fileserver.entity.CommonAttachment;
import com.dong.fileserver.entity.base.BaseAttachment;
import com.dong.fileserver.model.AttachmentVO;

import java.util.List;

/**
 * @author liudong
 * @date 2023/3/20
 */
public interface CommonAttachmentService {

    /**
     * 保存附件（上传至minio，路径保存至数据表中）
     *
     * @param relationId     关联业务id
     * @param attachmentIds  附件id
     * @param attachmentType 附件类型
     * @param relationModule 关联业务模块
     * @return
     */
    List<CommonAttachment> saveAttachment(String relationId, List<String> attachmentIds, String attachmentType, String relationModule);

    /**
     * 保存附件至minio
     *
     * @param attachment
     * @param module
     * @return
     */
    String saveAttachmentToMinio(BaseAttachment attachment, String module);

    /**
     * 从minio中删除附件
     *
     * @param fileUrls
     */
    void removeByMinio(List<String> fileUrls);

    /**
     * 根据业务id查询附件
     *
     * @param relationId
     * @return
     */
    List<CommonAttachment> findCommonAttachmentByRelationId(String relationId);

    List<AttachmentVO> findByRelationId(String relationId);

    void remove(String id);
}
