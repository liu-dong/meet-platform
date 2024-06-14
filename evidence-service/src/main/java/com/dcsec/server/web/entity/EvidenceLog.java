package com.dcsec.server.web.entity;

import javax.persistence.*;
import java.util.Date;
import com.dong.commoncore.entity.BaseEntity;

/**
 *  操作日志
 *
 *  @author LD
 */
@Entity
@Table(name = "base_evidence_log")
public class EvidenceLog extends BaseEntity {

    private static final long serialVersionUID = 9129521412982816117L;

    /**
     * 
     */
    private String evidenceId;
    /**
     * 
     */
    private String operatorId;
    /**
     * 
     */
    private Date operateDate;
    /**
     * 
     */
    private Integer operateType;

    @Column(name = "evidence_id")
    public String getEvidenceId(){
        return this.evidenceId;
    }

    public void setEvidenceId(String evidenceId){
        this.evidenceId = evidenceId;
    }

    @Column(name = "operator_id")
    public String getOperatorId(){
        return this.operatorId;
    }

    public void setOperatorId(String operatorId){
        this.operatorId = operatorId;
    }

    @Column(name = "operate_date")
    public Date getOperateDate(){
        return this.operateDate;
    }

    public void setOperateDate(Date operateDate){
        this.operateDate = operateDate;
    }

    @Column(name = "operate_type")
    public Integer getOperateType(){
        return this.operateType;
    }

    public void setOperateType(Integer operateType){
        this.operateType = operateType;
    }

}
