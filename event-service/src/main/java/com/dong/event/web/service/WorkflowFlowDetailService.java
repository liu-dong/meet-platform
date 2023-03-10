package com.dong.event.web.service;

import com.dong.event.web.entity.WorkflowFlowDetail;
import com.dong.event.web.model.dto.WorkflowFlowDetailDTO;

import java.util.List;

public interface WorkflowFlowDetailService {

    /**
     * 查询流程环节详情列表
     *
     * @param workflowId
     * @return
     */
    List<WorkflowFlowDetail> findWorkflowFlowDetailList(String workflowId);

    /**
     * 保存流程环节详情
     *
     * @param dto
     * @return
     */
    WorkflowFlowDetail saveWorkflowFlowDetail(WorkflowFlowDetailDTO dto);

    /**
     * 查询流程环节详情详情
     *
     * @param id
     * @return
     */
    WorkflowFlowDetail getWorkflowFlowDetail(String id);

    /**
    * 删除流程环节详情
    *
    * @param id
    * @return
    */
    void deleteWorkflowFlowDetail(String id);

    /**
     * 根据工作流id删除流程环节
     *
     * @param workflowId
     */
    void deleteWorkflowFlowDetailByWorkflow(String workflowId);

}