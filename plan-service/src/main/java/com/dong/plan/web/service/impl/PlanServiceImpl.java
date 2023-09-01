package com.dong.plan.web.service.impl;

import com.dong.commoncore.model.Pager;
import com.dong.plan.web.dao.PlanRepository;
import com.dong.plan.web.model.dto.PlanDTO;
import com.dong.plan.web.model.vo.PlanVO;
import com.dong.plan.web.service.PlanService;
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
        return null;
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
