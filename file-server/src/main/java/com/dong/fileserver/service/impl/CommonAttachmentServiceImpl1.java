package com.dong.fileserver.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.constant.SymbolConstant;
import com.dong.commoncore.entity.BaseAttachmentEntityEntity;
import com.dong.fileserver.config.MinioProperties;
import com.dong.fileserver.dao.CommonAttachmentRepository;
import com.dong.fileserver.entity.CommonAttachment;
import com.dong.fileserver.model.AttachmentVO;
import com.dong.fileserver.service.AttachmentService;
import com.dong.fileserver.service.CommonAttachmentService1;
import com.dong.fileserver.service.MinioFileService;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author liudong
 * @date 2023/3/20
 */
@Service
public class CommonAttachmentServiceImpl1 implements CommonAttachmentService1 {

    protected Logger logger = LoggerFactory.getLogger(CommonAttachmentServiceImpl1.class);

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
    @Transactional
    @Override
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
            String fileUrl = saveAttachmentToMinio(attachment, relationModule);
            convertAttachment(relationId, attachmentType, relationModule, i, attachment, fileUrl);
            attachments.add(attachment);
            attachmentService.remove(attachmentId);
        }
        if (CollUtil.isNotEmpty(attachments)) {
            commonAttachmentRepository.saveAll(attachments);
        }
        return attachments;
    }

    private void convertAttachment(String relationId, String attachmentType, String relationModule, int i, CommonAttachment attachment, String fileUrl) {
        attachment.setFileUrl(fileUrl);
        attachment.setFileData(null);
        attachment.setRelationId(relationId);
        attachment.setAttachmentType(attachmentType);
        attachment.setRelationModule(relationModule);
        attachment.setSortOrder(i + 1);
        attachment.setCreateTime(new Date());
        attachment.setUpdateTime(new Date());
        attachment.setDeleteStatus(CommonConstant.YES);
    }

    @Override
    public String saveAttachmentToMinio(BaseAttachmentEntityEntity attachment, String module) {
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
    private MultipartFile convertMultipartFile(BaseAttachmentEntityEntity attachment) {
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
    private String getObjectName(BaseAttachmentEntityEntity attachment, String module) {
        DateTimeFormatter yyyyMMdd = DateTimeFormatter.ofPattern("yyyyMMdd");
        String format = LocalDate.now().format(yyyyMMdd);
        String filePath = module + SymbolConstant.SLASH + format + SymbolConstant.SLASH + attachment.getId();
        return filePath + SymbolConstant.SLASH + attachment.getFileName();
    }

    @Override
    public void removeByMinio(List<String> fileUrls) {
        //拼接出文件全路径
        fileUrls = fileUrls.stream().map(item -> SymbolConstant.SLASH + item.substring(1)).collect(Collectors.toList());
        minioFileService.removeObjects(MinioProperties.BUCKET, fileUrls);
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

    @Override
    public void remove(String id) {
        CommonAttachment attachment = commonAttachmentRepository.findById(id).orElse(null);
        if (attachment != null) {
            attachment.setDeleteStatus(CommonConstant.YES);
            commonAttachmentRepository.save(attachment);
        }
    }
}
