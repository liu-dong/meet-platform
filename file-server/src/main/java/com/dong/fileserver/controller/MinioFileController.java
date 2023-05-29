package com.dong.fileserver.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.fileserver.service.MinioFileService;
import io.minio.Result;
import io.minio.errors.*;
import io.minio.messages.Bucket;
import io.minio.messages.Item;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Minio文件管理
 *
 * @author liudong 2022/9/24
 */
@Api(tags = "Minio文件管理")
@RestController
@RequestMapping("/minio/file")
public class MinioFileController {

    @Resource
    private MinioFileService minioFileService;

    @ApiOperation("查询存储桶列表")
    @GetMapping("/listBuckets")
    public ResponseResult listBuckets() {
        try {
            List<Bucket> buckets = minioFileService.listBuckets();
            List<String> result = buckets.stream().map(Bucket::name).collect(Collectors.toList());
            return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.QUERY_ERROR);
        }
    }

    /**
     * 创建存储桶
     *
     * @param bucketName
     * @return
     */
    @PostMapping("/makeBucket")
    public ResponseResult makeBucket(String bucketName) {
        try {
            minioFileService.makeBucket(bucketName);
            return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.OPERATE_ERROR);
        }
    }


    @ApiOperation("查询文件列表")
    @GetMapping("/listObjects")
    public ResponseResult listObjects(
            @ApiParam(value = "桶名称", required = true)
            @RequestParam("bucketName") String bucketName) {
        List<String> objectList = new ArrayList<>();
        Iterable<Result<Item>> results = minioFileService.listAllObjects(bucketName);
        for (Result<Item> result : results) {
            try {
                objectList.add(result.get().objectName());
            } catch (ErrorResponseException e) {
                throw new RuntimeException(e);
            } catch (InsufficientDataException e) {
                throw new RuntimeException(e);
            } catch (InternalException e) {
                throw new RuntimeException(e);
            } catch (InvalidKeyException e) {
                throw new RuntimeException(e);
            } catch (InvalidResponseException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            } catch (ServerException e) {
                throw new RuntimeException(e);
            } catch (XmlParserException e) {
                throw new RuntimeException(e);
            }
        }
        return ResponseResult.success(objectList, "操作成功");
    }




}
