package com.dong.chat.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  群成员
*
*  @author Lenovo
*/
@Entity
@Table(name = "group_member")
public class GroupMember implements Serializable {

    private static final long serialVersionUID = 1534864897067716089L;


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


    @Id
    @Column(name = "id")
    public String getId(){
        return this.id;
    }

    public void setId(String id){
        this.id = id;
    }

    @Column(name = "group_id")
    public String getGroupId(){
        return this.groupId;
    }

    public void setGroupId(String groupId){
        this.groupId = groupId;
    }

    @Column(name = "member_name")
    public String getMemberName(){
        return this.memberName;
    }

    public void setMemberName(String memberName){
        this.memberName = memberName;
    }

    @Column(name = "member_id")
    public String getMemberId(){
        return this.memberId;
    }

    public void setMemberId(String memberId){
        this.memberId = memberId;
    }

    @Column(name = "group_position")
    public String getGroupPosition(){
        return this.groupPosition;
    }

    public void setGroupPosition(String groupPosition){
        this.groupPosition = groupPosition;
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
