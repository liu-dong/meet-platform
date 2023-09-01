package com.dong.plan.web.entity;

import com.dong.commoncore.entity.BaseLogicDeleteEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 计划
 *
 * @author Lenovo
 */
@Entity
@Table(name = "plan")
public class Plan extends BaseLogicDeleteEntity {

    private static final long serialVersionUID = 6662990082813656606L;

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


    @Column(name = "plan_code")
    public String getPlanCode() {
        return this.planCode;
    }

    public void setPlanCode(String planCode) {
        this.planCode = planCode;
    }

    @Column(name = "plan_name")
    public String getPlanName() {
        return this.planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    @Column(name = "plan_type")
    public String getPlanType() {
        return this.planType;
    }

    public void setPlanType(String planType) {
        this.planType = planType;
    }

    @Column(name = "plan_target")
    public String getPlanTarget() {
        return this.planTarget;
    }

    public void setPlanTarget(String planTarget) {
        this.planTarget = planTarget;
    }

    @Column(name = "plan_content")
    public String getPlanContent() {
        return this.planContent;
    }

    public void setPlanContent(String planContent) {
        this.planContent = planContent;
    }

    @Column(name = "plan_status")
    public Integer getPlanStatus() {
        return this.planStatus;
    }

    public void setPlanStatus(Integer planStatus) {
        this.planStatus = planStatus;
    }

}
