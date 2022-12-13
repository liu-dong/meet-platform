package com.dong.fileserver.service;

import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.ObjectListing;

import java.io.InputStream;

/**
 * @author liudong 2022/9/24
 */
public interface OssFileService {

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

    /**
     * 判断文件是否存在
     *
     * @param fileName
     * @return
     */
    boolean exist(String fileName);

    /**
     * 列举文件
     *
     * @param keyPrefix 文件前缀
     * @return
     */
    ObjectListing listObjects(String keyPrefix);

    /**
     * 下载文件
     *
     * @param fileName
     * @return
     */
    OSSObject getObject(String fileName);
}
