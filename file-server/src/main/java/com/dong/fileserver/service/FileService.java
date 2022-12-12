package com.dong.fileserver.service;

import java.io.InputStream;

/**
 * @author liudong 2022/9/24
 */
public interface FileService {

    /**
     * 文件上传至阿里云
     *
     * @param inputStream
     * @param module
     * @param fileName
     * @return
     */
    String upload(InputStream inputStream, String module, String fileName);

    /**
     * 根据路径删除文件
     *
     * @param url
     */
    void removeFile(String url);
}
