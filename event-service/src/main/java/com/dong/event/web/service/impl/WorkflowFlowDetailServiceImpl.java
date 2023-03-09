package com.dong.event.web.service.impl;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import com.dong.event.web.dao.WorkflowFlowDetailJpaDao;
import com.dong.event.web.entity.WorkflowFlowDetail;
import com.dong.event.web.model.dto.WorkflowFlowDetailDTO;
import com.dong.event.web.model.vo.WorkflowFlowDetailVO;
import com.dong.event.web.service.WorkflowFlowDetailService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class WorkflowFlowDetailServiceImpl implements WorkflowFlowDetailService {

    @Resource
    WorkflowFlowDetailJpaDao workflowFlowDetailJpaDao;

    /**
    * 查询流程环节详情列表
    *
    * @param dto
    * @param pager
    * @return
    */
    @Override
    public Pager<WorkflowFlowDetailVO> findWorkflowFlowDetailList(WorkflowFlowDetailDTO dto, Pager<WorkflowFlowDetailVO> pager) {
        return null;
    }

    /**
     * 保存流程环节详情
     *
     * @param dto
     * @return
     */
    @Override
    public WorkflowFlowDetail saveWorkflowFlowDetail(WorkflowFlowDetailDTO dto) {
        WorkflowFlowDetail entity = new WorkflowFlowDetail();
        BeanUtils.copyProperties(dto, entity);
        if (StringUtils.isNotBlank(dto.getId())) {
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
            entity.setDeleteStatus(CommonConstant.NO);
        } else {
            WorkflowFlowDetail workflowFlowDetail = workflowFlowDetailJpaDao.findById(dto.getId()).orElse(new WorkflowFlowDetail());
            entity.setId(workflowFlowDetail.getId());
            entity.setUpdateTime(new Date());
        }
        return workflowFlowDetailJpaDao.save(entity);
    }

    /**
     * 查询流程环节详情详情
     *
     * @param id
     * @return
     */
    @Override
    public WorkflowFlowDetail getWorkflowFlowDetail(String id) {
        Assert.notNull(id, "id不能为空");
        return workflowFlowDetailJpaDao.findById(id).orElse(new WorkflowFlowDetail());
    }

    /**
    * 删除流程环节详情
    *
    * @param id
    * @return
    */
    @Override
    public void deleteWorkflowFlowDetail(String id) {
        Assert.notNull(id, "id不能为空");
        WorkflowFlowDetail workflowFlowDetail = workflowFlowDetailJpaDao.findById(id).orElse(new WorkflowFlowDetail());
        workflowFlowDetail.setDeleteStatus(CommonConstant.YES);
        workflowFlowDetail.setUpdateTime(new Date());
        workflowFlowDetailJpaDao.save(workflowFlowDetail);
    }

}