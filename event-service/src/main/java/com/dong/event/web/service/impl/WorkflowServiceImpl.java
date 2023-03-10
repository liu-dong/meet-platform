package com.dong.event.web.service.impl;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import com.dong.event.web.dao.WorkflowJpaDao;
import com.dong.event.web.entity.Workflow;
import com.dong.event.web.model.dto.WorkflowDTO;
import com.dong.event.web.model.vo.WorkflowVO;
import com.dong.event.web.service.WorkflowService;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class WorkflowServiceImpl implements WorkflowService {

    @Resource
    WorkflowJpaDao workflowJpaDao;
    @Resource
    CommonDao commonDao;

    /**
     * 查询工作流列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<WorkflowVO> findWorkflowList(WorkflowDTO dto, Pager<WorkflowVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id, workflow_name workflowName, workflow_code workflowCode, ");
        sql.append(" business_type businessType, run_status runStatus, run_version runVersion, create_time createTime ");
        sql.append(" FROM workflow ");
        sql.append(" WHERE delete_status=0 ");
        if (StringUtils.isNotBlank(dto.getWorkflowCode())) {
            sql.append(" AND workflow_code = ? ");
            params.add(dto.getWorkflowCode());
        }
        if (StringUtils.isNotBlank(dto.getWorkflowName())) {
            sql.append(" AND workflow_name = ? ");
            params.add(dto.getWorkflowName());
        }

        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, WorkflowVO.class);

    }

    /**
     * 保存工作流
     *
     * @param dto
     * @return
     */
    @Override
    public Workflow saveWorkflow(WorkflowDTO dto) {
        Workflow entity = new Workflow();
        BeanUtils.copyProperties(dto, entity);
        if (StringUtils.isBlank(dto.getId())) {
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
            entity.setDeleteStatus(CommonConstant.NO);
            entity.setWorkflowCode(CommonUtils.getRandomSixNum());
        } else {
            Workflow workflow = workflowJpaDao.findById(dto.getId()).orElse(new Workflow());
            entity.setId(workflow.getId());
        }
        entity.setUpdateTime(new Date());
        return workflowJpaDao.save(entity);
    }

    /**
     * 查询工作流详情
     *
     * @param id
     * @return
     */
    @Override
    public WorkflowVO getWorkflow(String id) {
        Assert.notNull(id, "id不能为空");
        Workflow workflow = workflowJpaDao.findById(id).orElse(new Workflow());
        return convertVO(workflow);
    }

    @NotNull
    private WorkflowVO convertVO(Workflow workflow) {
        WorkflowVO vo = new WorkflowVO();
        BeanUtils.copyProperties(workflow, vo);
        return vo;
    }

    /**
     * 删除工作流
     *
     * @param id
     * @return
     */
    @Override
    public void deleteWorkflow(String id) {
        Assert.notNull(id, "id不能为空");
        Workflow workflow = workflowJpaDao.findById(id).orElse(new Workflow());
        workflow.setDeleteStatus(CommonConstant.YES);
        workflow.setUpdateTime(new Date());
        workflowJpaDao.save(workflow);
    }

}