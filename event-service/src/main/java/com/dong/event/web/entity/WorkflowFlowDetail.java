package com.dong.event.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
*  流程环节详情
*
*  @author liudong
*/
@Entity
@Table(name = "workflow_flow_detail")
public class WorkflowFlowDetail implements Serializable {

    private static final long serialVersionUID = 6531066156285001738L;


    /**
    * 主键
    */
    private String id;

    /**
    * 工作流id
    */
    private String workflowId;

    /**
    * 环节名称
    */
    private String flowName;

    /**
    * 环节编码
    */
    private String flowCode;

    /**
    * 环节权限代码值
    */
    private String flowPermissionCode;

    /**
    * 库表映射
    */
    private String mappingTableName;

    /**
    * 表单布局id
    */
    private String formLayoutId;

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

    @Column(name = "flow_name")
    public String getFlowName(){
        return this.flowName;
    }

    public void setFlowName(String flowName){
        this.flowName = flowName;
    }

    @Column(name = "flow_code")
    public String getFlowCode(){
        return this.flowCode;
    }

    public void setFlowCode(String flowCode){
        this.flowCode = flowCode;
    }

    @Column(name = "flow_permission_code")
    public String getFlowPermissionCode(){
        return this.flowPermissionCode;
    }

    public void setFlowPermissionCode(String flowPermissionCode){
        this.flowPermissionCode = flowPermissionCode;
    }

    @Column(name = "mapping_table_name")
    public String getMappingTableName(){
        return this.mappingTableName;
    }

    public void setMappingTableName(String mappingTableName){
        this.mappingTableName = mappingTableName;
    }

    @Column(name = "form_layout_id")
    public String getFormLayoutId(){
        return this.formLayoutId;
    }

    public void setFormLayoutId(String formLayoutId){
        this.formLayoutId = formLayoutId;
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
