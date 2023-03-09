package com.dong.event.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  主干流程
*
*  @author liudong
*/
@Entity
@Table(name = "workflow_main_flow")
public class WorkflowMainFlow implements Serializable {

    private static final long serialVersionUID = 4073466981462528428L;


    /**
    * 主键
    */
    private String id;

    /**
    * 业务工单id
    */
    private String workflowId;

    /**
    * 流程环节id
    */
    private String flowDetailId;

    /**
    * 环节编码
    */
    private String flowCode;

    /**
    * 环节名称
    */
    private String flowName;

    /**
    * 操作顺序 并行：parallel，串联：serial
    */
    private String operationType;

    /**
    * 自动完成环节
    */
    private String autoCompleteFlow;

    /**
    * 自动完成环节名称
    */
    private String autoCompleteFlowName;

    /**
    * 环节顺序
    */
    private Integer flowSort;

    /**
    * 状态名称
    */
    private String statusName;

    /**
    * 是否开始环节 0:否，1:是
    */
    private Integer isStart;

    /**
    * 是否结束环节 0:否，1:是
    */
    private Integer isEnd;

    /**
    * 流程是否可重复 0:否，1:是
    */
    private Integer isRepeat;

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

    @Column(name = "workflow_id")
    public String getWorkflowId(){
        return this.workflowId;
    }

    public void setWorkflowId(String workflowId){
        this.workflowId = workflowId;
    }

    @Column(name = "flow_detail_id")
    public String getFlowDetailId(){
        return this.flowDetailId;
    }

    public void setFlowDetailId(String flowDetailId){
        this.flowDetailId = flowDetailId;
    }

    @Column(name = "flow_code")
    public String getFlowCode(){
        return this.flowCode;
    }

    public void setFlowCode(String flowCode){
        this.flowCode = flowCode;
    }

    @Column(name = "flow_name")
    public String getFlowName(){
        return this.flowName;
    }

    public void setFlowName(String flowName){
        this.flowName = flowName;
    }

    @Column(name = "operation_type")
    public String getOperationType(){
        return this.operationType;
    }

    public void setOperationType(String operationType){
        this.operationType = operationType;
    }

    @Column(name = "auto_complete_flow")
    public String getAutoCompleteFlow(){
        return this.autoCompleteFlow;
    }

    public void setAutoCompleteFlow(String autoCompleteFlow){
        this.autoCompleteFlow = autoCompleteFlow;
    }

    @Column(name = "auto_complete_flow_name")
    public String getAutoCompleteFlowName(){
        return this.autoCompleteFlowName;
    }

    public void setAutoCompleteFlowName(String autoCompleteFlowName){
        this.autoCompleteFlowName = autoCompleteFlowName;
    }

    @Column(name = "flow_sort")
    public Integer getFlowSort(){
        return this.flowSort;
    }

    public void setFlowSort(Integer flowSort){
        this.flowSort = flowSort;
    }

    @Column(name = "status_name")
    public String getStatusName(){
        return this.statusName;
    }

    public void setStatusName(String statusName){
        this.statusName = statusName;
    }

    @Column(name = "is_start")
    public Integer getIsStart(){
        return this.isStart;
    }

    public void setIsStart(Integer isStart){
        this.isStart = isStart;
    }

    @Column(name = "is_end")
    public Integer getIsEnd(){
        return this.isEnd;
    }

    public void setIsEnd(Integer isEnd){
        this.isEnd = isEnd;
    }

    @Column(name = "is_repeat")
    public Integer getIsRepeat(){
        return this.isRepeat;
    }

    public void setIsRepeat(Integer isRepeat){
        this.isRepeat = isRepeat;
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
