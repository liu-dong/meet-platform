package com.dong.log.web.model.dto;

import lombok.Data;

/**
 * 登录日志
 *
 * @author liudong
 */
@Data
public class OperateLogsDTO {
    private String id;//主键id
    private String account;//操作账号
    private String operateType;//操作类型 （add：新增、delete：删除、update：修改、select：查询）
    private String moduleName;//模块名称
    private String moduleCode;//模块编码
    private String operateObject;//操作对象
    private String loginIp;//登录IP
    private String content;//操作内容

}

