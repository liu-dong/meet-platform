package com.dong.event.enums;

/**
 * 紧急程度枚举类
 *
 * @author liudong
 * @date 2023/3/10
 */
public enum UrgencyDegreeEnum {
    normal("一般"),
    urgency("紧急"),
    ;


    private String name;

    UrgencyDegreeEnum(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
