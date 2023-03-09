package com.dong.event.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  工作流
*
*  @author liudong
*/
@Entity
@Table(name = "workflow")
public class Workflow implements Serializable {

    private static final long serialVersionUID = 3247567387769641381L;


    /**
    * 主键
    */
    private String id;

    /**
    * 工作流名称
    */
    private String workflowName;

    /**
    * 工作流编码
    */
    private String workflowCode;

    /**
    * 业务类型
    */
    private String businessType;

    /**
    * 应用地市
    */
    private String deployCity;

    /**
    * 运行状态 1、未上线，2、上线中，3、已停用，4、已删除
    */
    private Integer runStatus;

    /**
    * 运行版本
    */
    private Integer runVersion;

    /**
    * 版本说明
    */
    private String versionDescription;

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

    @Column(name = "workflow_name")
    public String getWorkflowName(){
        return this.workflowName;
    }

    public void setWorkflowName(String workflowName){
        this.workflowName = workflowName;
    }

    @Column(name = "workflow_code")
    public String getWorkflowCode(){
        return this.workflowCode;
    }

    public void setWorkflowCode(String workflowCode){
        this.workflowCode = workflowCode;
    }

    @Column(name = "business_type")
    public String getBusinessType(){
        return this.businessType;
    }

    public void setBusinessType(String businessType){
        this.businessType = businessType;
    }

    @Column(name = "deploy_city")
    public String getDeployCity(){
        return this.deployCity;
    }

    public void setDeployCity(String deployCity){
        this.deployCity = deployCity;
    }

    @Column(name = "run_status")
    public Integer getRunStatus(){
        return this.runStatus;
    }

    public void setRunStatus(Integer runStatus){
        this.runStatus = runStatus;
    }

    @Column(name = "run_version")
    public Integer getRunVersion(){
        return this.runVersion;
    }

    public void setRunVersion(Integer runVersion){
        this.runVersion = runVersion;
    }

    @Column(name = "version_description")
    public String getVersionDescription(){
        return this.versionDescription;
    }

    public void setVersionDescription(String versionDescription){
        this.versionDescription = versionDescription;
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
