package com.dong.chat.web.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 群聊表
 * @TableName group_chat
 */
public class GroupChat implements Serializable {

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

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    public String getId() {
        return id;
    }

    /**
     * 主键
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 群聊名称
     */
    public String getGroupChatName() {
        return groupChatName;
    }

    /**
     * 群聊名称
     */
    public void setGroupChatName(String groupChatName) {
        this.groupChatName = groupChatName;
    }

    /**
     * 群聊类型
     */
    public Integer getGroupChatType() {
        return groupChatType;
    }

    /**
     * 群聊类型
     */
    public void setGroupChatType(Integer groupChatType) {
        this.groupChatType = groupChatType;
    }

    /**
     * 群主
     */
    public String getGroupOwner() {
        return groupOwner;
    }

    /**
     * 群主
     */
    public void setGroupOwner(String groupOwner) {
        this.groupOwner = groupOwner;
    }

    /**
     * 群主id
     */
    public String getGroupOwnerId() {
        return groupOwnerId;
    }

    /**
     * 群主id
     */
    public void setGroupOwnerId(String groupOwnerId) {
        this.groupOwnerId = groupOwnerId;
    }

    /**
     * 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 是否删除 0：否、1：是
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**
     * 是否删除 0：否、1：是
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 创建人
     */
    public String getCreateUserId() {
        return createUserId;
    }

    /**
     * 创建人
     */
    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    /**
     * 修改时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 修改时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 修改人
     */
    public String getUpdateUserId() {
        return updateUserId;
    }

    /**
     * 修改人
     */
    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }
}