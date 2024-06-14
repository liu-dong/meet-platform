package com.dcsec.server.web.entity;

import javax.persistence.*;
import java.util.Date;
import com.dong.commoncore.entity.BaseEntity;

/**
 *  物证告警
 *
 *  @author LD
 */
@Entity
@Table(name = "base_evidence_alarm")
public class EvidenceAlarm extends BaseEntity {

    private static final long serialVersionUID = 6869812744838620474L;

    /**
     * 
     */
    private String createBy;
    /**
     * 
     */
    private Date lastUpdateTime;
    /**
     * 
     */
    private String lastUpdateBy;
    /**
     * 物证id
     */
    private String evidenceId;
    /**
     * 仓库id
     */
    private String warehouseid;
    /**
     * 仓库名称
     */
    private String warehousename;
    /**
     * 用户id
     */
    private String userid;
    /**
     * 用户名称
     */
    private String username;
    /**
     * 案件id
     */
    private String caseid;
    /**
     * 案件名称
     */
    private String casename;
    /**
     * 部门id
     */
    private String departmentid;
    /**
     * 部门名称
     */
    private String departmentname;
    /**
     * 物证编号
     */
    private String no;
    /**
     * 物证名称
     */
    private String name;
    /**
     * 告警人
     */
    private String personname;
    /**
     * 告警时间
     */
    private Date alarmDate;

    @Column(name = "create_by")
    public String getCreateBy(){
        return this.createBy;
    }

    public void setCreateBy(String createBy){
        this.createBy = createBy;
    }

    @Column(name = "last_update_time")
    public Date getLastUpdateTime(){
        return this.lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime){
        this.lastUpdateTime = lastUpdateTime;
    }

    @Column(name = "last_update_by")
    public String getLastUpdateBy(){
        return this.lastUpdateBy;
    }

    public void setLastUpdateBy(String lastUpdateBy){
        this.lastUpdateBy = lastUpdateBy;
    }

    @Column(name = "evidence_id")
    public String getEvidenceId(){
        return this.evidenceId;
    }

    public void setEvidenceId(String evidenceId){
        this.evidenceId = evidenceId;
    }

    @Column(name = "warehouseId")
    public String getWarehouseid(){
        return this.warehouseid;
    }

    public void setWarehouseid(String warehouseid){
        this.warehouseid = warehouseid;
    }

    @Column(name = "warehouseName")
    public String getWarehousename(){
        return this.warehousename;
    }

    public void setWarehousename(String warehousename){
        this.warehousename = warehousename;
    }

    @Column(name = "userId")
    public String getUserid(){
        return this.userid;
    }

    public void setUserid(String userid){
        this.userid = userid;
    }

    @Column(name = "userName")
    public String getUsername(){
        return this.username;
    }

    public void setUsername(String username){
        this.username = username;
    }

    @Column(name = "caseId")
    public String getCaseid(){
        return this.caseid;
    }

    public void setCaseid(String caseid){
        this.caseid = caseid;
    }

    @Column(name = "caseName")
    public String getCasename(){
        return this.casename;
    }

    public void setCasename(String casename){
        this.casename = casename;
    }

    @Column(name = "departmentId")
    public String getDepartmentid(){
        return this.departmentid;
    }

    public void setDepartmentid(String departmentid){
        this.departmentid = departmentid;
    }

    @Column(name = "departmentName")
    public String getDepartmentname(){
        return this.departmentname;
    }

    public void setDepartmentname(String departmentname){
        this.departmentname = departmentname;
    }

    @Column(name = "no")
    public String getNo(){
        return this.no;
    }

    public void setNo(String no){
        this.no = no;
    }

    @Column(name = "name")
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    @Column(name = "personName")
    public String getPersonname(){
        return this.personname;
    }

    public void setPersonname(String personname){
        this.personname = personname;
    }

    @Column(name = "alarm_date")
    public Date getAlarmDate(){
        return this.alarmDate;
    }

    public void setAlarmDate(Date alarmDate){
        this.alarmDate = alarmDate;
    }

}
