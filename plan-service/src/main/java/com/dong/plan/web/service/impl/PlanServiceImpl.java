package com.dong.plan.web.service.impl;

import cn.hutool.core.util.EnumUtil;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.constant.FormatterConstant;
import com.dong.commoncore.constant.SymbolConstant;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.DateUtils;
import com.dong.plan.enums.PlanStatusEnum;
import com.dong.plan.enums.PlanTypeEnum;
import com.dong.plan.web.dao.PlanRepository;
import com.dong.plan.web.entity.Plan;
import com.dong.plan.web.model.dto.PlanDTO;
import com.dong.plan.web.model.vo.PlanVO;
import com.dong.plan.web.service.PlanService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;

@Service
public class PlanServiceImpl implements PlanService {

    @Resource
    PlanRepository planRepository;
    @Resource
    CommonDao commonDao;

    /**
     * 查询计划列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<PlanVO> findPlanList(PlanDTO dto, Pager<PlanVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,plan_code,plan_name,plan_type,plan_target,plan_status,create_time ");
        sql.append(" FROM plan ");
        sql.append(" WHERE delete_status = 0 ");
        if (StringUtils.isNotBlank(dto.getPlanName())) {
            sql.append(" AND `plan_name` LIKE '%?%' ");
            params.add(dto.getPlanName());
        }
        if (StringUtils.isNotBlank(dto.getPlanType())) {
            sql.append(" AND `plan_type` = ? ");
            params.add(dto.getPlanType());
        }
        if (dto.getPlanStatus() != null) {
            sql.append(" AND `plan_status` = ? ");
            params.add(dto.getPlanStatus());
        }
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, PlanVO.class);

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
            entity.setPlanType(dto.getPlanType());
            entity.setPlanCode(getPlanCode(EnumUtil.fromString(PlanTypeEnum.class, dto.getPlanType())));
            entity.setPlanStatus(PlanStatusEnum.notStart.ordinal());
            entity.setDeleteStatus(CommonConstant.NO);
        } else {
            entity = planRepository.getReferenceById(dto.getId());
        }
        entity.setPlanName(dto.getPlanName());
        entity.setPlanTarget(dto.getPlanTarget());
        return entity;
    }

    /**
     * 生成计划编码
     * 年度计划 0000
     * 季度计划 00000
     * 月度计划 0000000
     * 周计划   000000000
     *
     * @return
     */
    private String getPlanCode(PlanTypeEnum planType) {
        LocalDate currentDate = LocalDate.now();
        StringBuilder result = new StringBuilder();
        switch (planType) {
            case year:
                result.append(currentDate.getYear());
                break;
            case quarter:
                result.append(currentDate.getYear())
                        .append(SymbolConstant.HYPHEN)
                        .append(DateUtils.getCurrentQuarter(currentDate));
                break;
            case month:
                result.append(currentDate.getYear())
                        .append(SymbolConstant.HYPHEN)
                        .append(DateUtils.getCurrentQuarter(currentDate))
                        .append(SymbolConstant.HYPHEN)
                        .append(String.format("%02d", currentDate.getMonthValue()));
                break;
            case week:
                result.append(currentDate.getYear())
                        .append(SymbolConstant.HYPHEN)
                        .append(DateUtils.getCurrentQuarter(currentDate))
                        .append(SymbolConstant.HYPHEN)
                        .append(currentDate.format(FormatterConstant.MONTHLY))
                        .append(SymbolConstant.HYPHEN)
                        .append(String.format("%02d", currentDate.get(WeekFields.ISO.weekOfWeekBasedYear())));
                break;
            default:
                throw new GlobalException("Invalid plan type: " + planType);
        }

        return result.toString();
    }

    /**
     * 查询计划详情
     *
     * @param id
     * @return
     */
    @Override
    public PlanVO getPlan(String id) {
        Plan plan = planRepository.getReferenceById(id);

        return convertVO(plan);
    }

    private PlanVO convertVO(Plan plan) {
        PlanVO vo = new PlanVO();
        BeanUtils.copyProperties(plan, vo);
        return vo;
    }

    /**
     * 删除计划
     *
     * @param id
     * @return
     */
    @Override
    public void deletePlan(String id) {
        planRepository.logicDelete(id);
    }

    @Override
    public void batchDeletePlan(List<String> ids) {
        planRepository.batchLogicDelete(ids);
    }

    @Override
    public void changePlanStatus(String id, String planStatus) {
        planRepository.changePlanStatus(id, planStatus);
    }

    @Override
    public void summary(String id, String summary) {
        Plan entity = planRepository.getReferenceById(id);
        entity.setSummary(summary);
        planRepository.save(entity);
    }
}
