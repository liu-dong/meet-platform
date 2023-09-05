package com.dong.commoncore.entity;

import javax.persistence.Column;
import javax.persistence.Transient;

/**
 * @author liudong
 * @date 2023/7/18
 */
public abstract class BaseAttachmentEntity extends BaseLogicDeleteEntity {

    private static final long serialVersionUID = 6955474923481781751L;


    /**
     * 关联业务id
     */
    private String relationId;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件类型
     */
    private String fileType;

    /**
     * 排序
     */
    private Integer sortOrder;

    /**
     * 文件
     */
    private byte[] fileData;

    /**
     * 文件地址
     */
    private String fileUrl;


    @Column(name = "relation_id" )
    public String getRelationId() {
        return this.relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    @Column(name = "file_name")
    public String getFileName() {
        return this.fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Column(name = "sort_order")
    public Integer getSortOrder() {
        return this.sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    @Column(name = "file_type")
    public String getFileType() {
        return this.fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    @Transient
    @Column(name = "file_data")
    public byte[] getFileData() {
        return this.fileData;
    }

    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }

    @Column(name = "file_url")
    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }
}
