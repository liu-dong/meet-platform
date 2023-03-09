package com.dong.event.web.model.dto;

import lombok.Data;

/**
*  主干流程
*
*  @author liudong
*/
@Data
public class WorkflowMainFlowDTO {

    /**
    * 主键
    */
    private String id;

    /**
    * 业务工单id
    */
    private String workflowId;

    /**
    * 流程环节id
    */
    private String flowDetailId;

    /**
    * 环节编码
    */
    private String flowCode;

    /**
    * 环节名称
    */
    private String flowName;

    /**
    * 操作顺序 并行：parallel，串联：serial
    */
    private String operationType;

    /**
    * 自动完成环节
    */
    private String autoCompleteFlow;

    /**
    * 自动完成环节名称
    */
    private String autoCompleteFlowName;

    /**
    * 环节顺序
    */
    private Integer flowSort;

    /**
    * 状态名称
    */
    private String statusName;

    /**
    * 是否开始环节 0:否，1:是
    */
    private Integer isStart;

    /**
    * 是否结束环节 0:否，1:是
    */
    private Integer isEnd;

    /**
    * 流程是否可重复 0:否，1:是
    */
    private Integer isRepeat;

    /**
    * 是否删除 0：否、1：是
    */
    private Integer deleteStatus;

}
