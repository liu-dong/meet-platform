package com.dong.event.enums;

/**
 * 事件状态枚举类
 *
 * @author liudong
 * @date 2023/3/10
 */
public enum EventStatusEnum {
    register("登记"),
    claim("响应"),
    deal("处理"),
    end("办结"),
    ;


    private String name;

    EventStatusEnum(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
