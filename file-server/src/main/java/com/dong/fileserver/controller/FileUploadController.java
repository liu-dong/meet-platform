package com.dong.fileserver.controller;

import com.dong.commoncore.util.CommonUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.*;
import java.util.Set;

/**
 * 分片上传、断点续传
 *
 * @author liudong
 * @date 2023/5/31
 */
@RestController
public class FileUploadController {

    @Resource
    private StringRedisTemplate redisTemplate;

    @PostMapping("/upload")
    public ResponseEntity<?> upload(
            @RequestParam("file") MultipartFile file,
            @RequestParam("fileName") String fileName,
            @RequestParam("chunk") Integer chunk,
            @RequestParam("chunkSize") Long chunkSize) {

        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("文件不能为空");
        }

        // 生成唯一的文件标识
        String identifier = CommonUtils.getUUID();

        // 将文件分片存储到服务器的临时目录
        File tempDir = new File("temp");
        if (!tempDir.exists()) {
            tempDir.mkdirs();
        }

        File tempFile = new File(tempDir, identifier + "_" + chunk);
        try (InputStream in = file.getInputStream(); OutputStream out = new FileOutputStream(tempFile)) {
            IOUtils.copy(in, out);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("文件上传失败");
        }

        // 将上传成功的分片信息存储到 Redis
        redisTemplate.opsForSet().add("file_upload_" + identifier, String.valueOf(chunk));

        return ResponseEntity.ok("分片上传成功");
    }

    @GetMapping("/check")
    public ResponseEntity<?> checkUploadProgress(@RequestParam("identifier") String identifier) {
        Set<String> uploadedChunks = redisTemplate.opsForSet().members("file_upload_" + identifier);

        if (uploadedChunks == null || uploadedChunks.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(uploadedChunks);
    }

    @PostMapping("/merge")
    public ResponseEntity<?> mergeFile(
            @RequestParam("fileName") String fileName,
            @RequestParam("identifier") String identifier,
            @RequestParam("totalChunks") Integer totalChunks) {

        File tempDir = new File("temp");
        File mergedFile = new File(tempDir, fileName);

        try (OutputStream out = new FileOutputStream(mergedFile, true)) {
            for (int i = 0; i < totalChunks; i++) {
                File tempFile = new File(tempDir, identifier + "_" + i);
                if (tempFile.exists()) {
                    try (InputStream in = new FileInputStream(tempFile)) {
                        IOUtils.copy(in, out);
                    }
                    tempFile.delete();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("文件合并失败");
        }

        // 删除 Redis 中的上传信息
        redisTemplate.delete("file_upload_" + identifier);

        return ResponseEntity.ok("文件合并成功");
    }
}
