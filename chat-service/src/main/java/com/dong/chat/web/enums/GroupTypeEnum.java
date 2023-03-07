package com.dong.chat.web.enums;

/**
 * @author liudong
 * @date 2023/3/7
 */
public enum GroupTypeEnum {

    Normal("普通群"),
    ;

    GroupTypeEnum(String name) {
        this.name = name;
    }
    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
