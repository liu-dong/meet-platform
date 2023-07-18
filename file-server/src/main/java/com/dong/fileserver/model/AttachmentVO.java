package com.dong.fileserver.model;

import lombok.Data;

import java.io.Serializable;

/**
 * 附件返回体
 *
 * @author liudong
 */
@Data
public class AttachmentVO implements Serializable {

    private static final long serialVersionUID = -3677353872261877105L;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件id
     */
    private String fileId;

    /**
     * 文件路径
     */
    private String fileUrl;

    /**
     * 附件base64
     */
    private String fileData;

    /**
     * 附件类型
     */
    private String fileType;

    /**
     * 排序
     */
    private Integer sortOrder;

}
