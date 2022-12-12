package com.dong.commoncore.enums;

/**
 * 登录方式枚举类
 *
 * @author liudong 2022/2/9
 */
public enum LoginTypeEnum {

    /**
     * 超级管理员用户类型
     */
    ACCOUNT("账号密码登录",1),
    /**
     * 管理员用户类型
     */
    EMAIL("邮箱登录",2),
    /**
     * 普通用户类型
     */
    QRCODE("二维码登录",3);

    private String name;
    private Integer code;

    LoginTypeEnum(String name, Integer code) {
        this.name = name;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
