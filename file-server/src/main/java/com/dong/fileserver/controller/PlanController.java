package com.dong.fileserver.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.fileserver.entity.CommonAttachment;
import com.dong.fileserver.service.CommonAttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author liudong
 * @date 2023/7/20
 */
@RestController
@RequestMapping("/plan")
public class PlanController {

    @Autowired
    CommonAttachmentService commonAttachmentService;

    @PostMapping("/savePlan")
    public ResponseResult savePlan(@RequestBody Map<String, Object> map) {
        List<CommonAttachment> commonAttachments = commonAttachmentService.saveAttachment((String) map.get("id"), (List<String>) map.get("attachmentIds"), "image", "plan");
        return ResponseResult.success(commonAttachments, ResponseMessageConstant.SAVE_SUCCESS);
    }
}
