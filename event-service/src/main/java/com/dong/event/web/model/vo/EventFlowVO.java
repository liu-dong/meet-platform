package com.dong.event.web.model.vo;

import lombok.Data;

import java.util.Date;

/**
*  事件流程
*
*  @author liudong
*/
@Data
public class EventFlowVO{

    /**
    * 主键
    */
    private String id;

    /**
    * 事件编码
    */
    private String eventCode;

    /**
    * 操作人id
    */
    private String operaterId;

    /**
    * 操作时间
    */
    private Date operateDate;

    /**
    * 备注
    */
    private String remark;

    /**
    * 流程内容
    */
    private String flowContent;

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
