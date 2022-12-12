package com.dong.fileserver.controller;

import com.dong.commoncore.contant.ResponseCodeConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.fileserver.service.FileService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author liudong 2022/9/24
 */
@Api(tags = "阿里云文件管理")
@RestController
@RequestMapping("/oss/file")
public class OssFileController {

    @Resource
    private FileService fileService;

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
            String uploadUrl = fileService.upload(inputStream, module, originalFilename);

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
        fileService.removeFile(url);
        return ResponseResult.success("删除成功");
    }
}
