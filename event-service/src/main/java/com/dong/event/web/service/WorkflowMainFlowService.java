package com.dong.event.web.service;

import com.dong.commoncore.model.Pager;
import com.dong.event.web.entity.WorkflowMainFlow;
import com.dong.event.web.model.dto.WorkflowMainFlowDTO;
import com.dong.event.web.model.vo.WorkflowMainFlowVO;

import java.util.List;

public interface WorkflowMainFlowService {

    /**
    * 查询主干流程列表
    *
    * @param workflowId
    * @return
    */
    Pager<WorkflowMainFlowVO> findWorkflowMainFlowList(String workflowId);

    /**
     * 保存主干流程
     *
     * @param dto
     * @return
     */
    List<WorkflowMainFlow> saveWorkflowMainFlow(List<WorkflowMainFlowDTO> dtoList);

    /**
     * 查询主干流程详情
     *
     * @param id
     * @return
     */
    WorkflowMainFlow getWorkflowMainFlow(String id);

    /**
    * 删除主干流程
    *
    * @param id
    * @return
    */
    void deleteWorkflowMainFlow(String id);

}