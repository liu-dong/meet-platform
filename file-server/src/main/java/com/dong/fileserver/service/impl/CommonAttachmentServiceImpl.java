package com.dong.fileserver.service.impl;

import com.dong.fileserver.dao.CommonAttachmentRepository;
import com.dong.fileserver.entity.CommonAttachment;
import com.dong.fileserver.service.CommonAttachmentService;
import org.springframework.stereotype.Service;

/**
 * @author liudong
 * @date 2023/7/20
 */
@Service
public class CommonAttachmentServiceImpl extends BaseAttachmentServiceImpl<CommonAttachment, CommonAttachmentRepository> implements CommonAttachmentService {

}
