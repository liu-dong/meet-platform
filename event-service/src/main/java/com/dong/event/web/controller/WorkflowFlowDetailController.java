package com.dong.event.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.event.web.entity.WorkflowFlowDetail;
import com.dong.event.web.model.dto.WorkflowFlowDetailDTO;
import com.dong.event.web.model.vo.WorkflowFlowDetailVO;
import com.dong.event.web.service.WorkflowFlowDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
*  流程环节详情
*
*  @author liudong
*/
@RestController
@RequestMapping("/workflowFlowDetail")
public class WorkflowFlowDetailController {

    @Autowired
    WorkflowFlowDetailService workflowFlowDetailService;

    /**
    * 查询流程环节详情列表
    *
    * @param dto
    * @param pager
    * @return
    */
    @PostMapping("/findWorkflowFlowDetailList")
    public ResponseResult findWorkflowFlowDetailList(@RequestBody WorkflowFlowDetailDTO dto, Pager<WorkflowFlowDetailVO> pager) {
        Pager<WorkflowFlowDetailVO> result = workflowFlowDetailService.findWorkflowFlowDetailList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 保存流程环节详情
    *
    * @param dto
    * @return
    */
    @PostMapping("/saveWorkflowFlowDetail")
    public ResponseResult saveWorkflowFlowDetail(@RequestBody WorkflowFlowDetailDTO dto) {
        WorkflowFlowDetail result = workflowFlowDetailService.saveWorkflowFlowDetail(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
    * 查询流程环节详情
    *
    * @param id
    * @return
    */
    @GetMapping("/getWorkflowFlowDetail")
    public ResponseResult getWorkflowFlowDetail(String id) {
        WorkflowFlowDetail result = workflowFlowDetailService.getWorkflowFlowDetail(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 删除流程环节详情
    *
    * @param id
    * @return
    */
    @PostMapping("/deleteWorkflowFlowDetail")
    public ResponseResult deleteWorkflowFlowDetail(String id) {
        workflowFlowDetailService.deleteWorkflowFlowDetail(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
