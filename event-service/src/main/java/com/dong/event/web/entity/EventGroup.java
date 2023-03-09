package com.dong.event.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  事件群聊关联
*
*  @author liudong
*/
@Entity
@Table(name = "event_group")
public class EventGroup implements Serializable {

    private static final long serialVersionUID = 2872747537881765157L;


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


    @Id
    @Column(name = "id")
    public String getId(){
        return this.id;
    }

    public void setId(String id){
        this.id = id;
    }

    @Column(name = "event_code")
    public String getEventCode(){
        return this.eventCode;
    }

    public void setEventCode(String eventCode){
        this.eventCode = eventCode;
    }

    @Column(name = "group_id")
    public String getGroupId(){
        return this.groupId;
    }

    public void setGroupId(String groupId){
        this.groupId = groupId;
    }

    @Column(name = "current_status")
    public Integer getCurrentStatus(){
        return this.currentStatus;
    }

    public void setCurrentStatus(Integer currentStatus){
        this.currentStatus = currentStatus;
    }

    @Column(name = "relation_type")
    public String getRelationType(){
        return this.relationType;
    }

    public void setRelationType(String relationType){
        this.relationType = relationType;
    }

    @Column(name = "delete_status")
    public Integer getDeleteStatus(){
        return this.deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus){
        this.deleteStatus = deleteStatus;
    }

    @Column(name = "create_time")
    public Date getCreateTime(){
        return this.createTime;
    }

    public void setCreateTime(Date createTime){
        this.createTime = createTime;
    }

    @Column(name = "create_user_id")
    public String getCreateUserId(){
        return this.createUserId;
    }

    public void setCreateUserId(String createUserId){
        this.createUserId = createUserId;
    }

    @Column(name = "update_time")
    public Date getUpdateTime(){
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime){
        this.updateTime = updateTime;
    }

    @Column(name = "update_user_id")
    public String getUpdateUserId(){
        return this.updateUserId;
    }

    public void setUpdateUserId(String updateUserId){
        this.updateUserId = updateUserId;
    }
}
