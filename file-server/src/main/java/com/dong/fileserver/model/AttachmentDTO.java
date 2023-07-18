package com.dong.fileserver.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class AttachmentDTO implements Serializable {
    private static final long serialVersionUID = -3677353872261877105L;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件内容（base64编码）
     */
    private String fileData;

    /**
     * 文件路径
     */
    private String filePath;

}
