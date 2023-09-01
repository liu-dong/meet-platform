package com.dong.plan.web.service.impl;

import com.dong.commoncore.model.Pager;
import com.dong.plan.enums.PlanStatusEnum;
import com.dong.plan.web.dao.PlanRepository;
import com.dong.plan.web.entity.Plan;
import com.dong.plan.web.model.dto.PlanDTO;
import com.dong.plan.web.model.vo.PlanVO;
import com.dong.plan.web.service.PlanService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PlanServiceImpl implements PlanService {

    @Resource
    PlanRepository planRepository;

    /**
     * 查询计划列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<PlanVO> findPlanList(PlanDTO dto, Pager<PlanVO> pager) {
        return null;
    }

    /**
     * 保存计划
     *
     * @param dto
     * @return
     */
    @Override
    public String savePlan(PlanDTO dto) {
        Plan entity = convertEntity(dto);
        planRepository.save(entity);
        return entity.getId();
    }

    private Plan convertEntity(PlanDTO dto) {
        Plan entity = new Plan();
        if (StringUtils.isBlank(dto.getId())) {
            entity.setPlanCode(getPlanCode());
            entity.setPlanStatus(PlanStatusEnum.notStart.ordinal());
        } else {
            entity = planRepository.getReferenceById(dto.getId());
        }
        BeanUtils.copyProperties(dto, entity);
        return entity;
    }

    /**
     * 生成计划编码
     *
     * @return
     */
    private String getPlanCode() {
        return "0000000000";
    }

    /**
     * 查询计划详情
     *
     * @param id
     * @return
     */
    @Override
    public PlanVO getPlan(String id) {
        return null;
    }

    /**
     * 删除计划
     *
     * @param id
     * @return
     */
    @Override
    public void deletePlan(String id) {
    }

}
