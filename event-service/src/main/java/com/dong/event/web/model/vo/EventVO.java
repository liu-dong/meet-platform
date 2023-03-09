package com.dong.event.web.model.vo;

import lombok.Data;

import java.util.Date;

/**
*  事件
*
*  @author liudong
*/
@Data
public class EventVO{

    /**
    * 主键
    */
    private String id;

    /**
    * 事件编码
    */
    private String eventCode;

    /**
    * 事件名称
    */
    private String eventName;

    /**
    * 操作人id
    */
    private String operaterId;

    /**
    * 事件描述
    */
    private String eventDescription;

    /**
    * 事发地址
    */
    private String happenAddress;

    /**
    * 事发区划名称
    */
    private String happenDivisionName;

    /**
    * 事发区划编码
    */
    private String happenDivisionCode;

    /**
    * 事发时间
    */
    private Date happenDate;

    /**
    * 坐标系：WGS84、GCJ02
    */
    private String mapType;

    /**
    * 坐标x(纬度)
    */
    private String mapX;

    /**
    * 坐标y(经度)
    */
    private String mapY;

    /**
    * 事件分类编码
    */
    private String eventCategoryCode;

    /**
    * 数据来源
    */
    private String dataSources;

    /**
    * 事件状态 register：登记、claim：响应、deal：处理、end：办结
    */
    private String eventStatus;

    /**
    * 预计完成时间
    */
    private Date expectCompleteDate;

    /**
    * 预计预警时间
    */
    private Date expectWarnDate;

    /**
    * 紧急程度 普通：normal、紧急：urgency
    */
    private String urgencyDegree;

    /**
    * 事件时效标签  正常：normal、预警：warn、超时：overdue
    */
    private String efficiency;

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
