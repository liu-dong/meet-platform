package com.meet.commoncore.enums;

/**
 * @author liudong 2022/4/12
 */
public enum DeleteStatusEnum {

    valid("有效", 0),
    invalid("无效", 1);

    private String name;
    private Integer code;

    DeleteStatusEnum(String name, Integer code) {
        this.name = name;
        this.code = code;
    }
}
