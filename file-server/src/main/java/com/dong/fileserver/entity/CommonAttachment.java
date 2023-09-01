package com.dong.fileserver.entity;

import com.dong.commoncore.entity.BaseAttachmentEntityEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 附件表
 *
 * @author liudong 2023/07/19
 */
@Entity
@Table(name = "common_attachment")
public class CommonAttachment extends BaseAttachmentEntityEntity {


    /**
     * 关联业务模块
     */
    private String relationModule;

    /**
     * 附件类型
     */
    private String attachmentType;


    @Column(name = "relation_module")
    public String getRelationModule() {
        return this.relationModule;
    }

    public void setRelationModule(String relationModule) {
        this.relationModule = relationModule;
    }

    @Column(name = "attachment_type")
    public String getAttachmentType() {
        return this.attachmentType;
    }

    public void setAttachmentType(String attachmentType) {
        this.attachmentType = attachmentType;
    }
}
