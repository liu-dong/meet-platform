package com.dong.plan.web.service;

import com.dong.commoncore.model.Pager;
import com.dong.plan.web.model.dto.PlanDTO;
import com.dong.plan.web.model.vo.PlanVO;

/**
 * 计划
 *
 * @author Lenovo
 */
public interface PlanService {

    /**
     * 查询计划列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<PlanVO> findPlanList(PlanDTO dto, Pager<PlanVO> pager);

    /**
     * 保存计划
     *
     * @param dto
     * @return
     */
    String savePlan(PlanDTO dto);

    /**
     * 查询计划详情
     *
     * @param id
     * @return
     */
    PlanVO getPlan(String id);

    /**
     * 删除计划
     *
     * @param id
     * @return
     */
    void deletePlan(String id);

}
