package com.dong.fileserver.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.UploadDownloadUtils;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * 上传文件到本地
 *
 * @author liudong
 */
@Api(tags = "本地文件管理")
@RestController
@RequestMapping("/local/file")
public class LocalFileController {

    @Value("${local.file.path}")
    private String localFilePath;

    /**
     * 上传附件到本地 (transferTo)
     *
     * @param file
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @PostMapping("/upload")
    public ResponseResult upload(MultipartFile file, String path) throws IllegalStateException, IOException {
        if (StringUtils.isEmpty(path)) {
            path = localFilePath;
        } else {
            path = localFilePath + path;
        }
        Map<String, Object> map = UploadDownloadUtils.uploadFirst(file, path);
        return ResponseResult.success(map, "请求成功！");
    }

    @PostMapping("/upload/second")
    public ResponseResult uploadByRequest(HttpServletRequest request) throws IllegalStateException, IOException {
        String path = request.getParameter("path");
        if (StringUtils.isEmpty(path)) {
            path = localFilePath;
        } else {
            path = localFilePath + path;
        }
        Map<String, Object> map = UploadDownloadUtils.uploadSecond(request, path);
        return ResponseResult.success(map, "请求成功！");
    }
}
