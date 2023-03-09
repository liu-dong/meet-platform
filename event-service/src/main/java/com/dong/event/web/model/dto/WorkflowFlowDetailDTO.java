package com.dong.event.web.model.dto;

import lombok.Data;

import java.util.Date;

/**
*  流程环节详情
*
*  @author liudong
*/
@Data
public class WorkflowFlowDetailDTO {

    /**
    * 主键
    */
    private String id;

    /**
    * 工作流id
    */
    private String workflowId;

    /**
    * 环节名称
    */
    private String flowName;

    /**
    * 环节编码
    */
    private String flowCode;

    /**
    * 环节权限代码值
    */
    private String flowPermissionCode;

    /**
    * 库表映射
    */
    private String mappingTableName;

    /**
    * 表单布局id
    */
    private String formLayoutId;

    /**
    * 是否删除 0：否、1：是
    */
    private Integer deleteStatus;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 创建人
    */
    private String createUserId;

    /**
    * 修改时间
    */
    private Date updateTime;

    /**
    * 修改人
    */
    private String updateUserId;

}
