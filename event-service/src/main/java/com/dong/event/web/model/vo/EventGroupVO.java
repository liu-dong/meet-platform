package com.dong.event.web.model.vo;

import lombok.Data;

import java.util.Date;

/**
*  事件群聊关联
*
*  @author liudong
*/
@Data
public class EventGroupVO{

    /**
    * 主键
    */
    private String id;

    /**
    * 事件编码
    */
    private String eventCode;

    /**
    * 群聊id
    */
    private String groupId;

    /**
    * 是否是事件当前所在群聊 0：不是、1：是
    */
    private Integer currentStatus;

    /**
    * 事件群聊关系  登记：register、转办：turn、分享：share
    */
    private String relationType;

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
