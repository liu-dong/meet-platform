package com.dong.fileserver.service.impl;

import com.dong.fileserver.config.MinioConfig;
import com.dong.fileserver.service.MinioFileService;
import io.minio.*;
import io.minio.errors.*;
import io.minio.http.Method;
import io.minio.messages.Bucket;
import io.minio.messages.DeleteError;
import io.minio.messages.DeleteObject;
import io.minio.messages.Item;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * @author liudong 2023/5/28
 */
@Service
public class MinioFileServiceImpl implements MinioFileService {

    @Autowired
    private MinioClient minioClient;

    @Autowired
    private MinioConfig minioConfig;


    @Override
    public List<Bucket> listBuckets() throws Exception {
        return minioClient.listBuckets();
    }

    @Override
    public boolean bucketExists(String bucketName) throws Exception {
        return minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
    }

    @Override
    public Iterable<Result<Item>> listObjects(String bucketName) {
        return minioClient.listObjects(ListObjectsArgs.builder().bucket(bucketName).build());
    }

    @Override
    public Iterable<Result<Item>> listAllObjects(String bucketName) {
        return minioClient.listObjects(ListObjectsArgs.builder().bucket(bucketName).recursive(true).build());
    }

    public void makeBucket(String bucketName) throws Exception {
        minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
    }

    public void removeBucket(String bucketName) throws Exception {
        minioClient.removeBucket(RemoveBucketArgs.builder().bucket(bucketName).build());
    }

    @SneakyThrows
    @Override
    public void composeObject(List<Map<String, String>> sourceMaps, String targetBucketName, String targetObjectName) {
        List<ComposeSource> sourceObjectList = new ArrayList<>();
        for (Map<String, String> sourceMap : sourceMaps) {
            sourceObjectList.add(
                    ComposeSource.builder().bucket(sourceMap.get("bucketName")).object(sourceMap.get("object")).build());
        }
        minioClient.composeObject(
                ComposeObjectArgs.builder()
                        .bucket(targetBucketName)
                        .object(targetObjectName)
                        .sources(sourceObjectList)
                        .build());

    }

    @SneakyThrows
    @Override
    public void copyObject(String targetBucketName, String targetObjectName, String sourceBucketName, String sourceObjectName) {
        minioClient.copyObject(
                CopyObjectArgs.builder()
                        .bucket(targetBucketName)
                        .object(targetObjectName)
                        .source(
                                CopySource.builder()
                                        .bucket(sourceBucketName)
                                        .object(sourceObjectName)
                                        .build())
                        .build());
    }

    @SneakyThrows
    @Override
    public GetObjectResponse getObject(String bucketName, String objectName) {
        return minioClient.getObject(
                GetObjectArgs.builder()
                        .bucket(bucketName)
                        .object(objectName)
                        .build());
    }

    @SneakyThrows
    @Override
    public void downloadObject(String bucketName, String objectName, String fileName) {
        minioClient.downloadObject(
                DownloadObjectArgs.builder()
                        .bucket(bucketName)
                        .object(objectName)
                        .filename(fileName)
                        .build());
    }

    @SneakyThrows
    @Override
    public String putObject(MultipartFile file, String bucketName, String objectName) {
        ObjectWriteResponse object = minioClient.putObject(
                PutObjectArgs.builder().bucket(bucketName).object(objectName).stream(
                                file.getInputStream(), file.getSize(), -1)
                        .contentType(file.getContentType())
                        .build());

        return object.object();
    }

    @SneakyThrows
    @Override
    public String putObject(InputStream inputStream, int fileSize, String fileType, String bucketName, String objectName) {
        ObjectWriteResponse object = minioClient.putObject(
                PutObjectArgs.builder().bucket(bucketName).object(objectName).stream(
                                inputStream, fileSize, -1)
                        .contentType(fileType)
                        .build());

        return object.object();
    }

    @SneakyThrows
    @Override
    public String uploadObject(String fileName, String bucketName, String objectName) {
        ObjectWriteResponse object = minioClient.uploadObject(
                UploadObjectArgs.builder()
                        .bucket(bucketName).object(objectName).filename(fileName).build());
        return object.object();
    }

    @SneakyThrows
    @Override
    public void removeObject(String bucketName, String objectName) {
        minioClient.removeObject(
                RemoveObjectArgs.builder().bucket(bucketName).object(objectName).build());
    }

    @SneakyThrows
    @Override
    public void removeObjects(String bucketName, List<String> objectNameList) {
        List<DeleteObject> objects = objectNameList.stream().map(DeleteObject::new).collect(Collectors.toList());
        Iterable<Result<DeleteError>> results = minioClient.removeObjects(
                RemoveObjectsArgs.builder().bucket(bucketName).objects(objects).build());
        for (Result<DeleteError> result : results) {
            DeleteError error = result.get();
            System.out.println("Error in deleting object " + error.objectName() + "; " + error.message());
        }
    }

    /**
     * 获取上传临时签名
     *
     * @param fileName
     * @param time
     * @return
     */
    public Map<String, String> getPolicy(String fileName, ZonedDateTime time) {
        PostPolicy postPolicy = new PostPolicy(minioConfig.getBucketName(), time);
        postPolicy.addEqualsCondition("key", fileName);
        try {
            Map<String, String> map = minioClient.getPresignedPostFormData(postPolicy);
            Map<String, String> result = new HashMap<>();
            map.forEach((k, v) -> result.put(k.replaceAll("-", ""), v));
            result.put("host", minioConfig.getUrl() + "/" + minioConfig.getBucketName());
            return result;
        } catch (ErrorResponseException e) {
            e.printStackTrace();
        } catch (ServerException e) {
            throw new RuntimeException(e);
        } catch (InsufficientDataException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        } catch (InvalidResponseException e) {
            throw new RuntimeException(e);
        } catch (XmlParserException e) {
            throw new RuntimeException(e);
        } catch (InternalException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    /**
     * 获取上传文件的url
     *
     * @param objectName
     * @param method
     * @param time
     * @param timeUnit
     * @return
     */
    public String getPolicyUrl(String objectName, Method method, int time, TimeUnit timeUnit) {
        try {
            return minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder()
                    .method(method)
                    .bucket(minioConfig.getBucketName())
                    .object(objectName)
                    .expiry(time, timeUnit).build());
        } catch (ErrorResponseException e) {
            e.printStackTrace();
        } catch (InsufficientDataException e) {
            e.printStackTrace();
        } catch (InternalException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (InvalidResponseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (XmlParserException e) {
            e.printStackTrace();
        } catch (ServerException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 上传文件
     *
     * @param file
     * @param fileName
     */
    public void upload(MultipartFile file, String fileName) {
        // 使用putObject上传一个文件到存储桶中。
        try {
            InputStream inputStream = file.getInputStream();
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(minioConfig.getBucketName())
                    .object(fileName)
                    .stream(inputStream, file.getSize(), -1)
                    .contentType(file.getContentType())
                    .build());
        } catch (ErrorResponseException e) {
            e.printStackTrace();
        } catch (InsufficientDataException e) {
            e.printStackTrace();
        } catch (InternalException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (InvalidResponseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (XmlParserException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据filename获取文件访问地址
     *
     * @param objectName
     * @param time
     * @param timeUnit
     * @return
     */
    public String getUrl(String objectName, int time, TimeUnit timeUnit) {
        String url = null;
        try {
            url = minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder()
                    .method(Method.GET)
                    .bucket(minioConfig.getBucketName())
                    .object(objectName)
                    .expiry(time, timeUnit).build());
        } catch (ErrorResponseException e) {
            e.printStackTrace();
        } catch (InsufficientDataException e) {
            e.printStackTrace();
        } catch (InternalException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (InvalidResponseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (XmlParserException e) {
            e.printStackTrace();
        } catch (ServerException e) {
            e.printStackTrace();
        }
        return url;
    }

}
