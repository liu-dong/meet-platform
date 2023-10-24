package com.dong.log.web.model.vo;

import lombok.Data;

import java.util.Date;

/**
 * 登录日志信息
 *
 * @author LD
 */
@Data
public class LoginLogsVO {
    private String id;//主键id
    private String account;//登录账号
    private Integer loginType;//登录方式 （1：账号密码登录、2：邮箱快捷登录、3：扫码登录）
    private Date loginTime;//登录时间
    private String loginAddress;//登录地点
    private String loginIP;//登录IP
    private String remark;//备注
    private Date createTime;//
    private Date updateTime;//

}
