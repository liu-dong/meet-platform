package com.dong.chat.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  群聊
*
*  @author Lenovo
*/
@Entity
@Table(name = "group_chat")
public class GroupChat implements Serializable {

    private static final long serialVersionUID = 7775180831059405678L;


    /**
    * 主键
    */
    private String id;

    /**
    * 群聊名称
    */
    private String groupChatName;

    /**
    * 群聊类型
    */
    private Integer groupChatType;

    /**
    * 群主
    */
    private String groupOwner;

    /**
    * 群主id
    */
    private String groupOwnerId;

    /**
    * 备注
    */
    private String remark;

    /**
    * 是否删除 0：否、1：是
    */
    private Integer isDelete;

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

    @Column(name = "group_chat_name")
    public String getGroupChatName(){
        return this.groupChatName;
    }

    public void setGroupChatName(String groupChatName){
        this.groupChatName = groupChatName;
    }

    @Column(name = "group_chat_type")
    public Integer getGroupChatType(){
        return this.groupChatType;
    }

    public void setGroupChatType(Integer groupChatType){
        this.groupChatType = groupChatType;
    }

    @Column(name = "group_owner")
    public String getGroupOwner(){
        return this.groupOwner;
    }

    public void setGroupOwner(String groupOwner){
        this.groupOwner = groupOwner;
    }

    @Column(name = "group_owner_id")
    public String getGroupOwnerId(){
        return this.groupOwnerId;
    }

    public void setGroupOwnerId(String groupOwnerId){
        this.groupOwnerId = groupOwnerId;
    }

    @Column(name = "remark")
    public String getRemark(){
        return this.remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }

    @Column(name = "is_delete")
    public Integer getIsDelete(){
        return this.isDelete;
    }

    public void setIsDelete(Integer isDelete){
        this.isDelete = isDelete;
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
