package com.dong.plan.web.model.vo;

import lombok.Data;

import java.util.Date;

/**
 * 计划
 *
 * @author Lenovo
 */
@Data
public class PlanVO {

    /**
     * 主键id
     */
    private String id;

    /**
     * 计划编码
     */
    private String planCode;

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

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人id
     */
    private String createUserId;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 修改人id
     */
    private String updateUserId;

    /**
     * 删除状态：0 未删除、1 已删除
     */
    private Integer deleteStatus;

}
