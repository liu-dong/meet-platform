package com.dong.fileserver.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
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
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
    public ResponseResult upload(MultipartFile file, String path) {
        if (StringUtils.isEmpty(path)) {
            path = localFilePath;
        } else {
            path = localFilePath + path;
        }
        Map<String, Object> map;
        try {
            map = UploadDownloadUtils.uploadFirst(file, path);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.UPLOAD_ERROR);
        }
        if ((boolean) map.get("success")) {
            return ResponseResult.success(map.get("data"), ResponseMessageConstant.UPLOAD_SUCCESS);
        } else {
            return ResponseResult.error(ResponseMessageConstant.UPLOAD_ERROR);
        }
    }

    /**
     * 批量上传
     *
     * @param files
     * @param path
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @PostMapping("/batch/upload")
    public ResponseResult batchUpload(MultipartFile[] files, String path) {

        if (StringUtils.isEmpty(path)) {
            path = localFilePath;
        } else {
            path = localFilePath + path;
        }
        List<Map<String, Object>> successList = new ArrayList<>();
        List<String> errorList = new ArrayList<>();
        Map<String, Object> result = new HashMap<>();
        for (MultipartFile file : files) {
            Map<String, Object> map = null;
            try {
                map = UploadDownloadUtils.uploadFirst(file, path);
            } catch (IOException e) {
                e.printStackTrace();
                errorList.add(file.getOriginalFilename());
            }
            if ((boolean) map.get("success")) {
                successList.add((Map<String, Object>) map.get("data"));
            } else {
                errorList.add(file.getOriginalFilename());
            }
        }
        result.put("success", successList);
        result.put("error", errorList);
        return ResponseResult.success(result, ResponseMessageConstant.UPLOAD_SUCCESS);
    }

    /**
     * 文件上传
     *
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @PostMapping("/upload/second")
    public ResponseResult uploadByRequest(HttpServletRequest request) {
        String path = request.getParameter("path");
        if (StringUtils.isEmpty(path)) {
            path = localFilePath;
        } else {
            path = localFilePath + path;
        }
        Map<String, Object> map;
        try {
            map = UploadDownloadUtils.uploadSecond(request, path);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseResult.error(ResponseMessageConstant.UPLOAD_ERROR);
        }
        return ResponseResult.success(map, ResponseMessageConstant.UPLOAD_SUCCESS);
    }

    /**
     * 下载文件
     *
     * @param path     想要下载的文件的路径
     * @param response
     */
    @PostMapping("/download")
    public void download(String path, HttpServletResponse response) {
        try {
            // path是指想要下载的文件的路径
            File file = new File(localFilePath + path);
            UploadDownloadUtils.download(file, response);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }


    /**
     * @param path     指想要下载的文件的路径
     * @param response
     * @功能描述 下载文件:将输入流中的数据循环写入到响应输出流中，而不是一次性读取到内存
     */
    @PostMapping("/downloadLocal")
    public void downloadLocal(String path, HttpServletResponse response) throws IOException {
        //文件全路径
        String allPath = localFilePath + path;
        UploadDownloadUtils.download(allPath, response);
    }

}
