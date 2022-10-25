package com.meet.commoncore.enums;/**
 *
 *
 * @author liudong 2022/2/11
 */
public enum ApplicationEnum {

    ADMIN_SERVER("后台管理服务","admin-server"),
    AUTHENTICATION_SERVER("认证服务","authentication-server");

    /**
     * 获取服务名称
     * @param code 编号
     * @return 服务名称
     */
    public static String getApplicationName(String code){
        for (ApplicationEnum value : ApplicationEnum.values()) {
            if (value.getCode().equals(code)){
                return value.getName();
            }
        }
        return "默认服务";
    }


    private String name;
    private String code;

    ApplicationEnum(String name, String code) {
        this.name = name;
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public String getCode() {
        return code;
    }

}
