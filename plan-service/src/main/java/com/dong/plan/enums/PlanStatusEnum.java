package com.dong.plan.enums;

/**
 * 计划进度枚举类
 *
 * @author liudong
 * @date 2023/9/1
 */
public enum PlanStatusEnum {

    notStart("未开始"),
    underway("进行中"),
    delay("延期"),
    unfinished("未完成"),
    finished("已完成"),
    ;

    private String name;

    PlanStatusEnum(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
