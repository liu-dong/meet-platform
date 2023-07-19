package com.dong.fileserver.controller;

import com.dong.fileserver.controller.base.BaseAttachmentController;
import com.dong.fileserver.dao.CommonAttachmentJpaDao;
import com.dong.fileserver.entity.CommonAttachment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 通用附件管理
 *
 * @author liudong
 * @date 2023/7/19
 */
@RestController
@RequestMapping("/common/attachment")
public class CommonAttachmentController extends BaseAttachmentController<CommonAttachment, CommonAttachmentJpaDao> {

}
