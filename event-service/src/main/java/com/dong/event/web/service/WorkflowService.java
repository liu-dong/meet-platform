package com.dong.event.web.service;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.event.web.entity.Workflow;
import com.dong.event.web.model.dto.WorkflowDTO;
import com.dong.event.web.model.vo.WorkflowVO;

public interface WorkflowService {

    /**
     * 查询工作流列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    PageVO<WorkflowVO> findWorkflowList(WorkflowDTO dto, Pagination pagination);

    /**
     * 保存工作流
     *
     * @param dto
     * @return
     */
    Workflow saveWorkflow(WorkflowDTO dto);

    /**
     * 查询工作流详情
     *
     * @param id
     * @return
     */
    WorkflowVO getWorkflow(String id);

    /**
     * 删除工作流
     *
     * @param id
     * @return
     */
    void deleteWorkflow(String id);

}
