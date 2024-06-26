package com.dong.plan.web.service;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.plan.web.model.dto.PlanDTO;
import com.dong.plan.web.model.vo.PlanVO;

import java.util.List;

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
     * @param pagination
     * @return
     */
    PageVO<PlanVO> findPlanList(PlanDTO dto, Pagination pagination);

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

    /**
     * 批量删除
     *
     * @param ids
     */
    void batchDeletePlan(List<String> ids);

    /**
     * 改变计划状态
     *
     * @param id
     * @param planStatus
     */
    void changePlanStatus(String id, String planStatus);

    void summary(String id, String summary);
}
