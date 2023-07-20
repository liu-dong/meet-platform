package com.dong.fileserver.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.constant.SymbolConstant;
import com.dong.fileserver.dao.CommonAttachmentRepository;
import com.dong.fileserver.entity.CommonAttachment;
import com.dong.fileserver.entity.base.BaseAttachment;
import com.dong.fileserver.model.AttachmentVO;
import com.dong.fileserver.service.AttachmentService;
import com.dong.fileserver.service.CommonAttachmentService;
import com.dong.fileserver.service.MinioFileService;
import org.apache.commons.lang3.ArrayUtils;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author liudong
 * @date 2023/3/20
 */
@Service
public class CommonAttachmentServiceImpl implements CommonAttachmentService {

    protected Logger logger = LoggerFactory.getLogger(CommonAttachmentServiceImpl.class);

    @Value("${minio.bucket.privete:}")
    private String bucket;
    @Value("${minio.file.path:}")
    private String minioFilePath;

    @Autowired
    AttachmentService attachmentService;
    @Autowired
    MinioFileService minioFileService;
    @Autowired
    CommonAttachmentRepository commonAttachmentRepository;


    /**
     * 保存附件
     *
     * @param relationId     关联业务id
     * @param attachmentIds  附件id
     * @param attachmentType 附件类型
     * @param relationModule 关联业务模块
     * @return
     */
    public List<CommonAttachment> saveAttachment(String relationId, List<String> attachmentIds, String attachmentType, String relationModule) {

        // 保存附件
        List<CommonAttachment> attachments = CollUtil.list(true);
        for (int i = 0; i < attachmentIds.size(); i++) {
            String attachmentId = attachmentIds.get(i);
            if (StrUtil.isBlank(attachmentId)) {
                continue;
            }
            CommonAttachment attachment = attachmentService.take(attachmentId);
            Assert.notNull(attachment, "附件缓存已失效，请重新上传附件！");
            this.saveAttachmentToMinio(attachment, relationModule);
            attachment.setRelationId(relationId);
            attachment.setAttachmentType(attachmentType);
            attachment.setRelationModule(relationModule);
            attachment.setSortOrder(i + 1);
            attachments.add(attachment);
            attachmentService.remove(attachmentId);
        }
        if (CollUtil.isNotEmpty(attachments)) {
            commonAttachmentRepository.saveAll(attachments);
        }
        return attachments;
    }

    @Override
    public void saveAttachmentToMinio(BaseAttachment attachment, String module) {

        int fileSize = ArrayUtils.getLength(attachment.getFileData());
        InputStream is = new ByteArrayInputStream(attachment.getFileData());
        DateTimeFormatter yyyyMMdd = DateTimeFormatter.ofPattern("yyyyMMdd");
        String format = LocalDate.now().format(yyyyMMdd);
        String filePath = module + "/" + format + "/" + attachment.getId();
        String path = minioFilePath + filePath + "/" + attachment.getFileName();
        logger.debug("bucket:{}", bucket);
        logger.debug("path:{}", path);
        String fileUrl = minioFileService.putObject(is, fileSize, attachment.getFileType(), bucket, path);
        //去除桶路径和文件存储根路径
        fileUrl = fileUrl.replace(bucket + SymbolConstant.SLASH + minioFilePath, "");

        System.err.println(fileUrl);
        attachment.setFileUrl(fileUrl);
        attachment.setFileData(null);
    }

    @Override
    public void removeByMinio(List<String> fileUrls) {
        //拼接出文件全路径
        fileUrls = fileUrls.stream().map(item -> SymbolConstant.SLASH + minioFilePath + item.substring(1)).collect(Collectors.toList());
        minioFileService.removeObjects(bucket, fileUrls);
    }

    @Override
    public List<CommonAttachment> findCommonAttachmentByRelationId(String relationId) {
        return commonAttachmentRepository.findByRelationIdAndDeleteStatus(relationId, CommonConstant.NO);
    }

    @Override
    public List<AttachmentVO> findByRelationId(String relationId) {
        List<CommonAttachment> commonAttachments = commonAttachmentRepository.findByRelationIdAndDeleteStatus(relationId, CommonConstant.NO);
        if (CollUtil.isEmpty(commonAttachments)) {
            return null;
        }
        return convertVO(commonAttachments);
    }

    /**
     * 转换附件列表
     *
     * @param attachmentList
     * @return
     */
    private List<AttachmentVO> convertVO(List<CommonAttachment> attachmentList) {
        return attachmentList.stream().map(entity -> {
            AttachmentVO vo = new AttachmentVO();
            BeanUtils.copyProperties(entity, vo);
            return vo;
        }).collect(Collectors.toList());
    }

    @NotNull
    public static AttachmentVO convertAttachmentResponse(CommonAttachment attachment) {
        AttachmentVO attachmentResponse = new AttachmentVO();
        attachmentResponse.setFileId(attachment.getId());
        attachmentResponse.setFileName(attachment.getFileName());
        attachmentResponse.setFileUrl(attachment.getFileUrl());
        attachmentResponse.setFileType(attachment.getFileType());
        return attachmentResponse;
    }

    @Override
    public void remove(String id) {
        CommonAttachment attachment = commonAttachmentRepository.findById(id).orElse(null);
        if (attachment != null) {
            attachment.setDeleteStatus(CommonConstant.YES);
            commonAttachmentRepository.save(attachment);
        }
    }
}
