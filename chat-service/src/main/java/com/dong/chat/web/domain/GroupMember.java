package com.dong.chat.web.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 群成员表
 * @TableName group_member
 */
public class GroupMember implements Serializable {
    /**
     * 主键
     */
    private String id;

    /**
     * 群id
     */
    private String groupId;

    /**
     * 成员名称
     */
    private String memberName;

    /**
     * 成员id
     */
    private String memberId;

    /**
     * 群职位 member：成员、manager：群管理员、owner：群主
     */
    private String groupPosition;

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
     * 群id
     */
    public String getGroupId() {
        return groupId;
    }

    /**
     * 群id
     */
    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    /**
     * 成员名称
     */
    public String getMemberName() {
        return memberName;
    }

    /**
     * 成员名称
     */
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    /**
     * 成员id
     */
    public String getMemberId() {
        return memberId;
    }

    /**
     * 成员id
     */
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    /**
     * 群职位 member：成员、manager：群管理员、owner：群主
     */
    public String getGroupPosition() {
        return groupPosition;
    }

    /**
     * 群职位 member：成员、manager：群管理员、owner：群主
     */
    public void setGroupPosition(String groupPosition) {
        this.groupPosition = groupPosition;
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