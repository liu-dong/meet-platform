package com.dcsec.server.web.entity;

import javax.persistence.*;
import java.util.Date;
import com.dong.commoncore.entity.BaseEntity;

/**
 *  物证申请
 *
 *  @author LD
 */
@Entity
@Table(name = "base_evidence_apply")
public class EvidenceApply extends BaseEntity {

    private static final long serialVersionUID = 8954415313115457078L;

    /**
     * 物证id
     */
    private String evidenceId;
    /**
     * 申请人id
     */
    private String applyUserId;
    /**
     * 申请状态
     */
    private Integer applyType;
    /**
     * 申请理由
     */
    private String applyDesc;
    /**
     * 申请部门id
     */
    private String applyDepartmentId;
    /**
     * 申请时间
     */
    private Date applyTime;
    /**
     * 审核人id
     */
    private String approveUserId;
    /**
     * 审核部门id
     */
    private String approveDepartmentId;
    /**
     * 审核时间
     */
    private Date approveTime;
    /**
     * 审核理由
     */
    private String approveDesc;
    /**
     * 是否审核
     */
    private Integer isApprove;
    /**
     * 备注
     */
    private Object memo;
    /**
     * 申请仓库部门
     */
    private String applyWarehouseDepartment;
    /**
     * 申请人名称
     */
    private String applyUserName;
    /**
     * 上一个状态
     */
    private Integer previousType;
    /**
     * 申请描述类型
     */
    private Integer applyDescType;

    @Column(name = "evidence_id")
    public String getEvidenceId(){
        return this.evidenceId;
    }

    public void setEvidenceId(String evidenceId){
        this.evidenceId = evidenceId;
    }

    @Column(name = "apply_user_id")
    public String getApplyUserId(){
        return this.applyUserId;
    }

    public void setApplyUserId(String applyUserId){
        this.applyUserId = applyUserId;
    }

    @Column(name = "apply_type")
    public Integer getApplyType(){
        return this.applyType;
    }

    public void setApplyType(Integer applyType){
        this.applyType = applyType;
    }

    @Column(name = "apply_desc")
    public String getApplyDesc(){
        return this.applyDesc;
    }

    public void setApplyDesc(String applyDesc){
        this.applyDesc = applyDesc;
    }

    @Column(name = "apply_department_id")
    public String getApplyDepartmentId(){
        return this.applyDepartmentId;
    }

    public void setApplyDepartmentId(String applyDepartmentId){
        this.applyDepartmentId = applyDepartmentId;
    }

    @Column(name = "apply_time")
    public Date getApplyTime(){
        return this.applyTime;
    }

    public void setApplyTime(Date applyTime){
        this.applyTime = applyTime;
    }

    @Column(name = "approve_user_id")
    public String getApproveUserId(){
        return this.approveUserId;
    }

    public void setApproveUserId(String approveUserId){
        this.approveUserId = approveUserId;
    }

    @Column(name = "approve_department_id")
    public String getApproveDepartmentId(){
        return this.approveDepartmentId;
    }

    public void setApproveDepartmentId(String approveDepartmentId){
        this.approveDepartmentId = approveDepartmentId;
    }

    @Column(name = "approve_time")
    public Date getApproveTime(){
        return this.approveTime;
    }

    public void setApproveTime(Date approveTime){
        this.approveTime = approveTime;
    }

    @Column(name = "approve_desc")
    public String getApproveDesc(){
        return this.approveDesc;
    }

    public void setApproveDesc(String approveDesc){
        this.approveDesc = approveDesc;
    }

    @Column(name = "is_approve")
    public Integer getIsApprove(){
        return this.isApprove;
    }

    public void setIsApprove(Integer isApprove){
        this.isApprove = isApprove;
    }

    @Column(name = "memo")
    public Object getMemo(){
        return this.memo;
    }

    public void setMemo(Object memo){
        this.memo = memo;
    }

    @Column(name = "apply_warehouse_department")
    public String getApplyWarehouseDepartment(){
        return this.applyWarehouseDepartment;
    }

    public void setApplyWarehouseDepartment(String applyWarehouseDepartment){
        this.applyWarehouseDepartment = applyWarehouseDepartment;
    }

    @Column(name = "apply_user_name")
    public String getApplyUserName(){
        return this.applyUserName;
    }

    public void setApplyUserName(String applyUserName){
        this.applyUserName = applyUserName;
    }

    @Column(name = "previous_type")
    public Integer getPreviousType(){
        return this.previousType;
    }

    public void setPreviousType(Integer previousType){
        this.previousType = previousType;
    }

    @Column(name = "apply_desc_type")
    public Integer getApplyDescType(){
        return this.applyDescType;
    }

    public void setApplyDescType(Integer applyDescType){
        this.applyDescType = applyDescType;
    }

}
