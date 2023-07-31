package com.dong.fileserver.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.constant.SymbolConstant;
import com.dong.commoncore.entity.BaseAttachmentEntity;
import com.dong.fileserver.config.MinioProperties;
import com.dong.fileserver.service.AttachmentService;
import com.dong.fileserver.service.BaseAttachmentService;
import com.dong.fileserver.service.MinioFileService;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author liudong
 * @date 2023/7/20
 */
public class BaseAttachmentServiceImpl<E extends BaseAttachmentEntity, R extends JpaRepository> implements BaseAttachmentService<E, R> {


    protected Logger logger = LoggerFactory.getLogger(BaseAttachmentServiceImpl.class);

    @Autowired
    AttachmentService attachmentService;
    @Autowired
    MinioFileService minioFileService;
    @Autowired
    R repository;

    /**
     * 保存附件
     *
     * @param relationId     关联业务id
     * @param attachmentIds  附件id
     * @param attachmentType 附件类型
     * @param relationModule 关联业务模块
     * @return
     */
    @Transactional
    @Override
    public List<E> saveAttachment(String relationId, String relationModule, List<String> attachmentIds, String attachmentType) {
        //获取待保存的附件
        List<E> attachmentList = getAttachmentList(attachmentIds);
        for (int i = 0; i < attachmentList.size(); i++) {
            E attachment = attachmentList.get(i);
            //上传至minio
            String fileUrl = saveAttachmentToMinio(attachment, relationModule);
            convertAttachment(relationId, i, attachment, fileUrl);
        }
        if (CollUtil.isNotEmpty(attachmentList)) {
            repository.saveAll(attachmentList);
        }
        return attachmentList;
    }

    private List<E> getAttachmentList(List<String> attachmentIds) {
        return attachmentIds.stream().map(attachmentId -> {
            E take = attachmentService.take(attachmentId);
            return take;
        }).filter(Objects::nonNull).collect(Collectors.toList());
    }

    private void convertAttachment(String relationId, int i, E attachment, String fileUrl) {
        attachment.setFileUrl(fileUrl);
        attachment.setFileData(null);
        attachment.setRelationId(relationId);
        attachment.setSortOrder(i + 1);
    }

    /**
     * 保存附件至minio
     *
     * @param attachment
     * @param module
     * @return
     */
    public String saveAttachmentToMinio(BaseAttachmentEntity attachment, String module) {
        //转换文件
        MultipartFile file = convertMultipartFile(attachment);
        //获取minio存储路径
        String objectName = getObjectName(attachment, module);
        //上传至minio得到文件存储路径
        String fileUrl = minioFileService.putObject(file, MinioProperties.BUCKET, objectName);
        //转换fileUrl值，去除桶路径和文件存储根路径
        return convertFileUrl(fileUrl);
    }

    @NotNull
    private MultipartFile convertMultipartFile(BaseAttachmentEntity attachment) {
        //根据文件类型转换出contentType
        String contentType = getContentType(attachment.getFileName());
        return new MockMultipartFile("file", attachment.getFileName(), contentType, attachment.getFileData());
    }

    private String getContentType(String fileName) {
        MediaType mediaType = MediaTypeFactory.getMediaType(fileName).orElse(MediaType.APPLICATION_OCTET_STREAM);
        return mediaType.toString();
    }

    /**
     * 转换fileUrl值，去除桶路径和文件存储根路径
     *
     * @param fileUrl
     * @return
     */
    @NotNull
    private String convertFileUrl(String fileUrl) {
        fileUrl = fileUrl.replace(MinioProperties.BUCKET + SymbolConstant.SLASH, "");
        return fileUrl;
    }

    @NotNull
    private String getObjectName(BaseAttachmentEntity attachment, String module) {
        DateTimeFormatter yyyyMMdd = DateTimeFormatter.ofPattern("yyyyMMdd");
        String format = LocalDate.now().format(yyyyMMdd);
        String filePath = module + SymbolConstant.SLASH + format + SymbolConstant.SLASH + attachment.getId();
        return filePath + SymbolConstant.SLASH + attachment.getFileName();
    }

    public void removeByMinio(List<String> fileUrls) {
        //拼接出文件全路径
        fileUrls = fileUrls.stream().map(item -> SymbolConstant.SLASH + item.substring(1)).collect(Collectors.toList());
        minioFileService.removeObjects(MinioProperties.BUCKET, fileUrls);
    }

    @Override
    public List<E> findByRelationId(String relationId) {
        return repository.findByRelationIdAndDeleteStatus(relationId, CommonConstant.NO);
    }

    @Override
    public void remove(String id) {
        E attachment = (E) repository.findById(id).orElse(null);
        if (attachment != null) {
            attachment.setDeleteStatus(CommonConstant.YES);
            repository.save(attachment);
            removeByMinio(Collections.singletonList(attachment.getFileUrl()));
        }
    }
}
