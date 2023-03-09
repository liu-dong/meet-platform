package com.dong.event.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.event.web.entity.WorkflowMainFlow;
import com.dong.event.web.model.dto.WorkflowMainFlowDTO;
import com.dong.event.web.model.vo.WorkflowMainFlowVO;
import com.dong.event.web.service.WorkflowMainFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
*  主干流程
*
*  @author liudong
*/
@RestController
@RequestMapping("/workflowMainFlow")
public class WorkflowMainFlowController {

    @Autowired
    WorkflowMainFlowService workflowMainFlowService;

    /**
    * 查询主干流程列表
    *
    * @param workflowId
    * @return
    */
    @GetMapping("/findWorkflowMainFlowList")
    public ResponseResult findWorkflowMainFlowList(String workflowId) {
        Pager<WorkflowMainFlowVO> result = workflowMainFlowService.findWorkflowMainFlowList(workflowId);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 保存主干流程
    *
    * @param dtoList
    * @return
    */
    @PostMapping("/saveWorkflowMainFlow")
    public ResponseResult saveWorkflowMainFlow(@RequestBody List<WorkflowMainFlowDTO> dtoList) {
        List<WorkflowMainFlow> result = workflowMainFlowService.saveWorkflowMainFlow(dtoList);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
    * 查询主干流程
    *
    * @param id
    * @return
    */
    @GetMapping("/getWorkflowMainFlow")
    public ResponseResult getWorkflowMainFlow(String id) {
        WorkflowMainFlow result = workflowMainFlowService.getWorkflowMainFlow(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 删除主干流程
    *
    * @param id
    * @return
    */
    @PostMapping("/deleteWorkflowMainFlow")
    public ResponseResult deleteWorkflowMainFlow(String id) {
        workflowMainFlowService.deleteWorkflowMainFlow(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
