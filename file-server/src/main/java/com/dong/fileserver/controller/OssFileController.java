package com.dong.fileserver.controller;

import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.ObjectListing;
import com.dong.commoncore.contant.ResponseCodeConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.fileserver.service.OssFileService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * @author liudong 2022/9/24
 */
@Api(tags = "阿里云文件管理")
@RestController
@RequestMapping("/oss/file")
public class OssFileController {

    @Resource
    private OssFileService ossFileService;

    /**
     * 文件上传
     */
    @ApiOperation("文件上传")
    @PostMapping("/upload")
    public ResponseResult upload(@ApiParam(value = "文件", required = true) @RequestParam("file") MultipartFile file,

                                 @ApiParam(value = "模块", required = true) @RequestParam("module") String module) {

        try {
            InputStream inputStream = file.getInputStream();
            String originalFilename = file.getOriginalFilename();
            String uploadUrl = ossFileService.upload(inputStream, module, originalFilename);

            return ResponseResult.success(uploadUrl, "文件上传成功");
        } catch (IOException e) {
            throw new GlobalException(ResponseCodeConstant.FAILURE_CODE, e.getMessage());
        }
    }

    @ApiOperation("删除OSS文件")
    @DeleteMapping("/remove")
    public ResponseResult remove(
            @ApiParam(value = "要删除的文件路径", required = true)
            @RequestParam("url") String url) {
        ossFileService.removeFile(url);
        return ResponseResult.success("删除成功");
    }


    @ApiOperation("判断文件是否存在")
    @GetMapping("/exist")
    public ResponseResult exist(
            @ApiParam(value = "文件名称", required = true)
            @RequestParam("fileName") String fileName) {
        boolean result = ossFileService.exist(fileName);
        return ResponseResult.success(result, "操作成功");
    }

    @ApiOperation("查询文件列表")
    @GetMapping("/listObjects")
    public ResponseResult listObjects(
            @ApiParam(value = "文件名称前缀", required = true)
            @RequestParam("fileNamePrefix") String fileNamePrefix) {
        ObjectListing objectListing = ossFileService.listObjects(fileNamePrefix);
        return ResponseResult.success(objectListing, "操作成功");
    }

    @ApiOperation("下载文件")
    @PostMapping("/down")
    public ResponseResult down(
            @ApiParam(value = "文件名称", required = true)
            @RequestParam("fileName") String fileName) {
        OSSObject object = ossFileService.getObject(fileName);
        BufferedReader reader = new BufferedReader(new InputStreamReader(object.getObjectContent()));
        while (true) {
            String line;
            try {
                line = reader.readLine();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            if (line == null) break;
            System.out.println("\n" + line);
        }
        try {
            // 数据读取完成后，获取的流必须关闭，否则会造成连接泄漏，导致请求无连接可用，程序无法正常工作。
            reader.close();
            // ossObject对象使用完毕后必须关闭，否则会造成连接泄漏，导致请求无连接可用，程序无法正常工作。
            object.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return ResponseResult.success("操作成功");
    }


}
