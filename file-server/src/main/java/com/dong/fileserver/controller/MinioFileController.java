package com.dong.fileserver.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.fileserver.service.MinioFileService;
import io.minio.Result;
import io.minio.messages.Bucket;
import io.minio.messages.Item;
import lombok.SneakyThrows;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Minio文件管理
 *
 * @author liudong 2022/9/24
 */
@RestController
@RequestMapping("/minio/file")
public class MinioFileController {

    @Resource
    private MinioFileService minioFileService;

    /**
     * 查询存储桶列表
     *
     * @return
     */
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

    /**
     * 判断存储桶是否存在
     *
     * @param bucketName
     * @return
     */
    @GetMapping("/bucketExists")
    public ResponseResult bucketExists(String bucketName) {
        try {
            boolean result = minioFileService.bucketExists(bucketName);
            return ResponseResult.success(result, ResponseMessageConstant.OPERATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.OPERATE_ERROR);
        }
    }

    /**
     * 删除存储桶
     *
     * @param bucketName
     * @return
     */
    @PostMapping("/removeBucket")
    public ResponseResult removeBucket(String bucketName) {
        try {
            minioFileService.removeBucket(bucketName);
            return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.OPERATE_ERROR);
        }
    }

    /**
     * 查询文件列表
     *
     * @param bucketName 桶名称
     * @return
     */
    @SneakyThrows
    @GetMapping("/listObjects")
    public ResponseResult listObjects(String bucketName) {
        List<String> objectList = new ArrayList<>();
        Iterable<Result<Item>> results = minioFileService.listAllObjects(bucketName);
        for (Result<Item> result : results) {
            objectList.add(result.get().objectName());
        }
        return ResponseResult.success(objectList, "操作成功");
    }

    /**
     * 上传对象
     *
     * @param bucketName
     * @return
     */
    @PostMapping("/putObject")
    public ResponseResult putObject(@RequestParam MultipartFile file, @RequestParam String bucketName, @RequestParam String objectName) {
        try {
            minioFileService.putObject(file, bucketName, objectName);
            return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.OPERATE_ERROR);
        }
    }

    /**
     * 获取对象
     *
     * @param bucketName
     * @param objectName
     * @return
     */
    @GetMapping("/getObject")
    public void getObject(HttpServletResponse response, @RequestParam String bucketName, @RequestParam String objectName) {
        try {
            InputStream inputStream = minioFileService.getObject(bucketName, objectName);

            // 清空response
            response.reset();
            // 设置response的Header
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/octet-stream");
            response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(objectName, "UTF-8"));
            // 告知浏览器文件的大小
//            response.addHeader("Content-Length", "" + inputStream.available());

            byte[] buffer = new byte[1024];
            OutputStream outputStream = response.getOutputStream();
            int len;
            while ((len = inputStream.read(buffer)) != -1) {
                response.getOutputStream().write(buffer, 0, len);
            }
            outputStream.write(buffer);
            outputStream.flush();


            outputStream.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除对象
     *
     * @param bucketName
     * @param objectName
     * @return
     */
    @PostMapping("/removeObject")
    public ResponseResult removeObject(String bucketName, String objectName) {
        try {
            minioFileService.removeObject(bucketName, objectName);
            return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.OPERATE_ERROR);
        }
    }

    /**
     * 删除多个对象
     *
     * @param bucketName
     * @param objectNameList
     * @return
     */
    @PostMapping("/removeObjects")
    public ResponseResult removeObjects(@RequestParam String bucketName, @RequestParam List<String> objectNameList) {
        try {
            minioFileService.removeObjects(bucketName, objectNameList);
            return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.OPERATE_ERROR);
        }
    }
}
