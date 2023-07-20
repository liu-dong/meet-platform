package com.dong.fileserver.service.impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import com.dong.commoncore.entity.BaseAttachmentEntity;
import com.dong.fileserver.service.AttachmentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author liudong
 * @date 2023/7/18
 */
@Service
public class LocalAttachmentService implements AttachmentService {

    public static final String KEY_ATTACHMENT_TEMP_MAP = "KEY_ATTACHMENT_TEMP_MAP";

    @Value("${attachment.temp.base.path:/file/attachment}")
    String basePath;

    @Autowired
    LocalCacheService localCacheService;

    @Override
    public void put(String id, BaseAttachmentEntity attachment) {
        byte[] fileData = attachment.getFileData();
        String filePath = this.getFilePath(id);
        FileOutputStream os = null;
        try {
            os = new FileOutputStream(filePath);
            IoUtil.write(os, true, fileData);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (os != null) {
                    os.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Map<String, BaseAttachmentEntity> map = this.getCacheMap();
        attachment.setFileData(null);
        map.put(id, attachment);
    }

    @Override
    public <T extends BaseAttachmentEntity> T get(String id) {
        if (StrUtil.isBlank(id)) {
            return null;
        }
        // 从硬盘中获取附件
        String filePath = getFilePath(id);
        InputStream is = null;
        byte[] fileData = null;
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                return null;
            }
            is = Files.newInputStream(file.toPath());
            fileData = IoUtil.readBytes(is);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (is != null) {
                    is.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // 获取缓存中的附件数据
        Map<String, BaseAttachmentEntity> map = this.getCacheMap();
        BaseAttachmentEntity attachment = map.get(id);
        if (attachment == null) {
            return null;
        }
        attachment.setFileData(fileData);
        return (T)attachment;
    }

    @Override
    public void remove(String id) {
        String filePath = this.getFilePath(id);
        FileUtil.del(filePath);
        this.getCacheMap().remove(id);
    }

    @Override
    public <T extends BaseAttachmentEntity> T take(String id) {
        T domain = this.get(id);
        this.remove(id);
        return domain;
    }

    private synchronized Map<String, BaseAttachmentEntity> getCacheMap() {
        Map<String, BaseAttachmentEntity> attachmentMap = localCacheService.get(KEY_ATTACHMENT_TEMP_MAP);
        if (attachmentMap == null) {
            attachmentMap = new ConcurrentHashMap<>();
            localCacheService.put(KEY_ATTACHMENT_TEMP_MAP, attachmentMap);
        }
        return attachmentMap;
    }

    private String getBasePath() {
        HttpServletRequest request = getHttpRequest();
        if (StringUtils.isBlank(this.basePath)) {
            this.basePath = "/file/attachment";
        }
        return request.getSession().getServletContext().getRealPath(this.basePath);
    }

    public HttpServletRequest getHttpRequest() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs != null ? attrs.getRequest() : null;
    }

    private String getBasePath(String id) {
        String basePath = this.getBasePath();
        basePath = basePath + "/" + id.charAt(0);
        if (id.length() > 1) {
            basePath = basePath + "/" + id.charAt(1);
        }

        File caFile = new File(basePath);
        if (!caFile.exists()) {
            caFile.mkdirs();
        }

        return basePath;
    }

    private String getFilePath(String id) {
        return this.getBasePath(id) + "/" + id;
    }
}
