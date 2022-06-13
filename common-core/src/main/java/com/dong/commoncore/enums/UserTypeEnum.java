package com.dong.commoncore.enums;

/**
 * 用户类型枚举类
 * @author LD
 */
public enum UserTypeEnum {

    /**
     * 超级管理员用户类型
     */
    SUPER_ADMIN("超级管理员",0),
    /**
     * 管理员用户类型
     */
    ADMIN("管理员",1),
    /**
     * 普通用户类型
     */
    USER("普通用户",2),
    /**
     * 商家用户类型
     */
    BUSINESS_USERS("商家用户",3);

    private String name;
    private Integer code;

    UserTypeEnum(String name, Integer code) {
        this.name = name;
        this.code = code;
    }

    /**
     * 获取角色名称
     * @param code 编号
     * @return 角色名称
     */
    public static String getNameByRole(Integer code){
        for (UserTypeEnum value : UserTypeEnum.values()) {
            if (value.getCode().equals(code)){
                return value.getName();
            }
        }
        return "普通用户";
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
