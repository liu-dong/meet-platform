package com.dong.event.web.service.impl;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.CurrentUserUtils;
import com.dong.event.web.dao.WorkflowMainFlowRepository;
import com.dong.event.web.entity.WorkflowMainFlow;
import com.dong.event.web.model.dto.WorkflowMainFlowDTO;
import com.dong.event.web.service.WorkflowMainFlowService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class WorkflowMainFlowServiceImpl implements WorkflowMainFlowService {

    @Resource
    WorkflowMainFlowRepository workflowMainFlowRepository;

    /**
     * 查询主干流程列表
     *
     * @param workflowId
     * @return
     */
    @Override
    public List<WorkflowMainFlow> findWorkflowMainFlowList(String workflowId) {
        return workflowMainFlowRepository.findByWorkflowIdOrderByFlowSortAsc(workflowId);
    }

    /**
     * 保存主干流程
     *
     * @param dtoList
     * @return
     */
    @Override
    public List<WorkflowMainFlow> saveWorkflowMainFlow(List<WorkflowMainFlowDTO> dtoList) {
        List<WorkflowMainFlow> entityList = new ArrayList<>();
        for (WorkflowMainFlowDTO dto : dtoList) {
            WorkflowMainFlow entity = new WorkflowMainFlow();
            BeanUtils.copyProperties(dto, entity);
            if (StringUtils.isNotBlank(dto.getId())) {
                WorkflowMainFlow workflowMainFlow = workflowMainFlowRepository.findById(dto.getId()).orElse(new WorkflowMainFlow());
                entity.setId(workflowMainFlow.getId());
                entity.setCreateTime(workflowMainFlow.getCreateTime());
                entity.setCreateUserId(CurrentUserUtils.getUserId());
                entity.setCreateUserId(workflowMainFlow.getCreateUserId());
            } else {
                entity.setId(CommonUtils.getUUID());
                entity.setCreateTime(new Date());
            }
            entity.setUpdateUserId(CurrentUserUtils.getUserId());
            entity.setUpdateTime(new Date());
            entityList.add(entity);
        }
        return workflowMainFlowRepository.saveAll(entityList);
    }

    /**
     * 查询主干流程详情
     *
     * @param id
     * @return
     */
    @Override
    public WorkflowMainFlow getWorkflowMainFlow(String id) {
        return workflowMainFlowRepository.findById(id).orElse(new WorkflowMainFlow());
    }

    /**
     * 删除主干流程
     *
     * @param id
     * @return
     */
    @Override
    public void deleteWorkflowMainFlow(String id) {
        WorkflowMainFlow entity = workflowMainFlowRepository.findById(id).orElse(new WorkflowMainFlow());
        entity.setDeleteStatus(CommonConstant.YES);
        workflowMainFlowRepository.save(entity);
    }

    @Override
    public void deleteWorkflowMainFlowByWorkflow(String workflowId) {
        List<WorkflowMainFlow> mainFlows = workflowMainFlowRepository.findByWorkflowIdOrderByFlowSortAsc(workflowId);
        for (WorkflowMainFlow mainFlow : mainFlows) {
            mainFlow.setDeleteStatus(CommonConstant.YES);
        }
        workflowMainFlowRepository.saveAll(mainFlows);
    }
}
