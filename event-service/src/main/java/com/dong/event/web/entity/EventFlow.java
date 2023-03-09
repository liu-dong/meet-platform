package com.dong.event.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  事件流程
*
*  @author liudong
*/
@Entity
@Table(name = "event_flow")
public class EventFlow implements Serializable {

    private static final long serialVersionUID = 4995606229956254760L;


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

    @Column(name = "operater_id")
    public String getOperaterId(){
        return this.operaterId;
    }

    public void setOperaterId(String operaterId){
        this.operaterId = operaterId;
    }

    @Column(name = "operate_date")
    public Date getOperateDate(){
        return this.operateDate;
    }

    public void setOperateDate(Date operateDate){
        this.operateDate = operateDate;
    }

    @Column(name = "remark")
    public String getRemark(){
        return this.remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }

    @Column(name = "flow_content")
    public String getFlowContent(){
        return this.flowContent;
    }

    public void setFlowContent(String flowContent){
        this.flowContent = flowContent;
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
