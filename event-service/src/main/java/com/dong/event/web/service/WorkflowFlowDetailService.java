package com.dong.event.web.service;

import com.dong.commoncore.model.Pager;
import com.dong.event.web.entity.WorkflowFlowDetail;
import com.dong.event.web.model.dto.WorkflowFlowDetailDTO;
import com.dong.event.web.model.vo.WorkflowFlowDetailVO;

public interface WorkflowFlowDetailService {

    /**
    * 查询流程环节详情列表
    *
    * @param dto
    * @param pager
    * @return
    */
    Pager<WorkflowFlowDetailVO> findWorkflowFlowDetailList(WorkflowFlowDetailDTO dto, Pager<WorkflowFlowDetailVO> pager);

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

}