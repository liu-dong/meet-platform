package com.dong.plan.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.plan.web.model.dto.PlanDTO;
import com.dong.plan.web.model.vo.PlanVO;
import com.dong.plan.web.service.PlanService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 计划管理
 *
 * @author Lenovo
 */
@RestController
@RequestMapping("/plan")
public class PlanController {

    @Resource
    PlanService planService;

    /**
     * 查询计划列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @GetMapping("/findPlanList")
    public ResponseResult findPlanList(PlanDTO dto, Pager<PlanVO> pager) {
        Pager<PlanVO> result = planService.findPlanList(dto, pager);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存计划
     *
     * @param dto
     * @return
     */
    @PostMapping("/savePlan")
    public ResponseResult savePlan(@RequestBody PlanDTO dto) {
        String result = planService.savePlan(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询计划
     *
     * @param id
     * @return
     */
    @GetMapping("/getPlan")
    public ResponseResult getPlan(String id) {
        PlanVO result = planService.getPlan(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除计划
     *
     * @param id
     * @return
     */
    @PostMapping("/deletePlan")
    public ResponseResult deletePlan(String id) {
        planService.deletePlan(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }

    /**
     * 批量删除计划
     *
     * @param ids
     * @return
     */
    @PostMapping("/batchDeletePlan")
    public ResponseResult batchDeletePlan(List<String> ids) {
        planService.batchDeletePlan(ids);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
