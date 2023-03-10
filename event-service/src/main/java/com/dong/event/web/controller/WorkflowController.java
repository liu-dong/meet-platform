package com.dong.event.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.event.web.entity.Workflow;
import com.dong.event.web.model.dto.WorkflowDTO;
import com.dong.event.web.model.vo.WorkflowVO;
import com.dong.event.web.service.WorkflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 工作流
 *
 * @author liudong
 */
@RestController
@RequestMapping("/workflow")
public class WorkflowController {

    @Autowired
    WorkflowService workflowService;

    /**
     * 查询工作流列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @PostMapping("/findWorkflowList")
    public ResponseResult findWorkflowList(@RequestBody WorkflowDTO dto, Pager<WorkflowVO> pager) {
        Pager<WorkflowVO> result = workflowService.findWorkflowList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存工作流
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveWorkflow")
    public ResponseResult saveWorkflow(@RequestBody WorkflowDTO dto) {
        Workflow result = workflowService.saveWorkflow(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询工作流
     *
     * @param id
     * @return
     */
    @GetMapping("/getWorkflow")
    public ResponseResult getWorkflow(String id) {
        WorkflowVO result = workflowService.getWorkflow(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除工作流
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteWorkflow")
    public ResponseResult deleteWorkflow(String id) {
        workflowService.deleteWorkflow(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
