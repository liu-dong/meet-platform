package com.dong.event.web.model.dto;

import lombok.Data;

import java.util.Date;

/**
*  工作流
*
*  @author liudong
*/
@Data
public class WorkflowDTO {

    /**
    * 主键
    */
    private String id;

    /**
    * 工作流名称
    */
    private String workflowName;

    /**
    * 工作流编码
    */
    private String workflowCode;

    /**
    * 业务类型
    */
    private String businessType;

    /**
    * 应用地市
    */
    private String deployCity;

    /**
    * 运行状态 1、未上线，2、上线中，3、已停用，4、已删除
    */
    private Integer runStatus;

    /**
    * 运行版本
    */
    private Integer runVersion;

    /**
    * 版本说明
    */
    private String versionDescription;

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
