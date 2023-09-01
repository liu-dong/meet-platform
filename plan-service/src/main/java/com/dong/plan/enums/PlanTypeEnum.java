package com.dong.plan.enums;

/**
 * 计划类型枚举类
 *
 * @author liudong
 * @date 2023/9/1
 */
public enum PlanTypeEnum {

    day("日计划"),
    week("周计划"),
    month("月度计划"),
    quarter("季度计划"),
    year("年度计划"),
    ;

    private String name;

    PlanTypeEnum(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
