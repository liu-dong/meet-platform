package com.dcsec.server.web.model.vo;

import lombok.Data;
import java.util.Date;

/**
 *  物证申请
 *
 *  @author LD
 */
@Data
public class EvidenceApplyVO{

    /**
     * 
     */
    private String id;

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

}
