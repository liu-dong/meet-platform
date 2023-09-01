package com.dong.plan.web.model.dto;

import lombok.Data;

/**
 * 计划
 *
 * @author Lenovo
 */
@Data
public class PlanDTO {

    /**
     * 主键id
     */
    private String id;

    /**
     * 计划名称
     */
    private String planName;

    /**
     * 计划类型 day：日计划、week：周计划、month：月计划，year：年计划
     */
    private String planType;

    /**
     * 计划目标
     */
    private String planTarget;

    /**
     * 计划内容
     */
    private String planContent;

    /**
     * 计划状态 1：未开始，2：进行中，3：已完成，4：延期
     */
    private Integer planStatus;

}
