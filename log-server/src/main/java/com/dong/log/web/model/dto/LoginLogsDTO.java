package com.dong.log.web.model.dto;

import lombok.Data;

/**
 * 登录日志信息
 *
 * @author LD
 */
@Data
public class LoginLogsDTO {
    private String id;//主键id
    private String account;//登录账号
    private Integer loginType;//登录方式 （1：账号密码登录、2：邮箱快捷登录、3：扫码登录）
    private String loginAddress;//登录地点
    private String loginIp;//登录IP
    private String remark;//备注

}
