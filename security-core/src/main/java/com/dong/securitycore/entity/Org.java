package com.dong.securitycore.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 组织机构表
 *
 * @author liudong 2022/12/28
 */
@Entity
@Table(name = "sys_org")
public class Org implements Serializable {

    private static final long serialVersionUID = 7464287547440001873L;


    /**
     * 主键id
     */
    private String id;

    /**
     * 单位名称
     */
    private String orgName;

    /**
     * 单位编码
     */
    private String orgCode;

    /**
     * 单位类型
     */
    private Integer orgType;

    /**
     * 单位区域代码
     */
    private String orgDivisionCode;

    /**
     * 地址
     */
    private String orgAddress;

    /**
     * 是否删除 0：未删除、1：已删除
     */
    private Integer deleteStatus;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人id
     */
    private String createUserId;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 修改人id
     */
    private String updateUserId;

    @Id
    @Column(name = "id")
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "org_name")
    public String getOrgName() {
        return this.orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    @Column(name = "org_code")
    public String getOrgCode() {
        return this.orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    @Column(name = "org_type")
    public Integer getOrgType() {
        return this.orgType;
    }

    public void setOrgType(Integer orgType) {
        this.orgType = orgType;
    }

    @Column(name = "org_division_code")
    public String getOrgDivisionCode() {
        return this.orgDivisionCode;
    }

    public void setOrgDivisionCode(String orgDivisionCode) {
        this.orgDivisionCode = orgDivisionCode;
    }

    @Column(name = "org_address")
    public String getOrgAddress() {
        return this.orgAddress;
    }

    public void setOrgAddress(String orgAddress) {
        this.orgAddress = orgAddress;
    }

    @Column(name = "delete_status")
    public Integer getDeleteStatus() {
        return this.deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

    @Column(name = "create_time")
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "create_user_id")
    public String getCreateUserId() {
        return this.createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Column(name = "update_time")
    public Date getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Column(name = "update_user_id")
    public String getUpdateUserId() {
        return this.updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }

}
