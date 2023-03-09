package com.dong.event.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  事件
*
*  @author liudong
*/
@Entity
@Table(name = "event")
public class Event implements Serializable {

    private static final long serialVersionUID = 3184553078083062938L;


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

    @Column(name = "event_name")
    public String getEventName(){
        return this.eventName;
    }

    public void setEventName(String eventName){
        this.eventName = eventName;
    }

    @Column(name = "operater_id")
    public String getOperaterId(){
        return this.operaterId;
    }

    public void setOperaterId(String operaterId){
        this.operaterId = operaterId;
    }

    @Column(name = "event_description")
    public String getEventDescription(){
        return this.eventDescription;
    }

    public void setEventDescription(String eventDescription){
        this.eventDescription = eventDescription;
    }

    @Column(name = "happen_address")
    public String getHappenAddress(){
        return this.happenAddress;
    }

    public void setHappenAddress(String happenAddress){
        this.happenAddress = happenAddress;
    }

    @Column(name = "happen_division_name")
    public String getHappenDivisionName(){
        return this.happenDivisionName;
    }

    public void setHappenDivisionName(String happenDivisionName){
        this.happenDivisionName = happenDivisionName;
    }

    @Column(name = "happen_division_code")
    public String getHappenDivisionCode(){
        return this.happenDivisionCode;
    }

    public void setHappenDivisionCode(String happenDivisionCode){
        this.happenDivisionCode = happenDivisionCode;
    }

    @Column(name = "happen_date")
    public Date getHappenDate(){
        return this.happenDate;
    }

    public void setHappenDate(Date happenDate){
        this.happenDate = happenDate;
    }

    @Column(name = "map_type")
    public String getMapType(){
        return this.mapType;
    }

    public void setMapType(String mapType){
        this.mapType = mapType;
    }

    @Column(name = "map_x")
    public String getMapX(){
        return this.mapX;
    }

    public void setMapX(String mapX){
        this.mapX = mapX;
    }

    @Column(name = "map_y")
    public String getMapY(){
        return this.mapY;
    }

    public void setMapY(String mapY){
        this.mapY = mapY;
    }

    @Column(name = "event_category_code")
    public String getEventCategoryCode(){
        return this.eventCategoryCode;
    }

    public void setEventCategoryCode(String eventCategoryCode){
        this.eventCategoryCode = eventCategoryCode;
    }

    @Column(name = "data_sources")
    public String getDataSources(){
        return this.dataSources;
    }

    public void setDataSources(String dataSources){
        this.dataSources = dataSources;
    }

    @Column(name = "event_status")
    public String getEventStatus(){
        return this.eventStatus;
    }

    public void setEventStatus(String eventStatus){
        this.eventStatus = eventStatus;
    }

    @Column(name = "expect_complete_date")
    public Date getExpectCompleteDate(){
        return this.expectCompleteDate;
    }

    public void setExpectCompleteDate(Date expectCompleteDate){
        this.expectCompleteDate = expectCompleteDate;
    }

    @Column(name = "expect_warn_date")
    public Date getExpectWarnDate(){
        return this.expectWarnDate;
    }

    public void setExpectWarnDate(Date expectWarnDate){
        this.expectWarnDate = expectWarnDate;
    }

    @Column(name = "urgency_degree")
    public String getUrgencyDegree(){
        return this.urgencyDegree;
    }

    public void setUrgencyDegree(String urgencyDegree){
        this.urgencyDegree = urgencyDegree;
    }

    @Column(name = "efficiency")
    public String getEfficiency(){
        return this.efficiency;
    }

    public void setEfficiency(String efficiency){
        this.efficiency = efficiency;
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
