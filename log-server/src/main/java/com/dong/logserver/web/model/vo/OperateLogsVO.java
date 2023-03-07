package com.dong.logserver.web.model.vo;

import lombok.Data;

import java.util.Date;

/**
 * 登录日志
 *
 * @author liudong
 */
@Data
public class OperateLogsVO {
    private String id;//主键id
    private String account;//操作账号
    private String operateType;//操作类型 （add：新增、delete：删除、update：修改、select：查询）
    private Date operateTime;//操作时间
    private String moduleName;//模块名称
    private String moduleCode;//模块编码
    private String operateObject;//操作对象
    private String loginIp;//登录IP
    private String content;//操作内容
    private Date createTime;//
    private Date updateTime;//

}
