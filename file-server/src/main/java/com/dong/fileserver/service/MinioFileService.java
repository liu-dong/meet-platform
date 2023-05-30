package com.dong.fileserver.service;

import io.minio.GetObjectResponse;
import io.minio.Result;
import io.minio.messages.Bucket;
import io.minio.messages.Item;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @author liudong
 */
public interface MinioFileService {

    /**
     * 存储桶信息列表
     *
     * @return
     */
    List<Bucket> listBuckets() throws Exception;

    /**
     * 判断桶是否存在
     *
     * @return
     */
    boolean bucketExists(String bucketName) throws Exception;

    /**
     * 创建桶
     *
     * @param bucketName
     */
    void makeBucket(String bucketName) throws Exception;


    /**
     * 删除桶(桶内必须为空)
     *
     * @param bucketName
     * @throws Exception
     */
    void removeBucket(String bucketName) throws Exception;

    /**
     * 列出桶的对象
     *
     * @param bucketName
     * @return
     */
    Iterable<Result<Item>> listObjects(String bucketName);

    /**
     * 列出桶的对象（递归）
     *
     * @param bucketName
     * @return
     */
    Iterable<Result<Item>> listAllObjects(String bucketName);

    /**
     * 通过使用服务器端复制合并来自不同源对象的数据来创建对象。
     *
     * @param sourceMaps       源数据(源桶，源对象)
     * @param targetBucketName 目标桶
     * @param targetObjectName 目标对象
     * @return
     */
    void composeObject(List<Map<String, String>> sourceMaps, String targetBucketName, String targetObjectName);

    /**
     * 通过服务器端从另一个对象复制数据来创建对象。
     *
     * @param targetBucketName 目标桶
     * @param targetObjectName 目标对象
     * @param sourceBucketName 源桶
     * @param sourceObjectName 源对象
     */
    void copyObject(String targetBucketName, String targetObjectName, String sourceBucketName, String sourceObjectName);

    /**
     * 获取对象的数据
     *
     * @param bucketName
     * @param objectName
     * @return
     */
    GetObjectResponse getObject(String bucketName, String objectName);

    /**
     * 将对象的数据下载到文件
     *
     * @param bucketName
     * @param objectName
     * @param fileName
     */
    void downloadObject(String bucketName, String objectName, String fileName);

    /**
     * 将给定的流作为存储桶中的对象上传
     *
     * @param file
     * @param bucketName
     * @param objectName
     * @return
     */
    String putObject(MultipartFile file, String bucketName, String objectName);

    /**
     * 将文件中的内容作为存储桶中的对象上传
     *
     * @param file
     * @param bucketName
     * @param objectName
     */
    void uploadObject(MultipartFile file, String bucketName, String objectName);

    /**
     * 删除对象
     *
     * @param bucketName
     * @param objectName
     */
    void removeObject(String bucketName, String objectName);

    /**
     * 删除多个对象
     *
     * @param bucketName
     * @param objectNameList
     */
    void removeObjects(String bucketName, List<String> objectNameList);

}
