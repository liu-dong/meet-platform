package com.dong.billingservice.web.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;

/**
 * 账单明细
 *
 * @author zhang.jiaxin
 * @since 2022-05-28
 */
public class BillingDetailsDTO {

    /**
     * 主键
     */
    private String id;
    /**
     * 记录时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String recordTime;
    /**
     * 支出类型 0：其他、1：餐饮、2：交通、3：房租、4：娱乐、5：通讯、6：学习、7：购物
     */
    private Integer spendingType;
    /**
     * 支出金额
     */
    private BigDecimal amountPaid;
    /**
     * 备注
     */
    private String remark;
    /**
     * 创建时间
     */
    private String createTime;
    /**
     * 创建人
     */
    private String createUserId;
    /**
     * 修改时间
     */
    private String updateTime;
    /**
     * 修改人
     */
    private String updateUserId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(String recordTime) {
        this.recordTime = recordTime;
    }

    public Integer getSpendingType() {
        return spendingType;
    }

    public void setSpendingType(Integer spendingType) {
        this.spendingType = spendingType;
    }

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }
}
