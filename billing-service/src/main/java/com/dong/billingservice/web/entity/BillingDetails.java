package com.dong.billingservice.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 账单明细表
 *
 * @author liudong 2022/05/28
 */
@Entity
@Table (name = "billing_details")
public class BillingDetails implements Serializable {

	private static final long serialVersionUID = 2401483565947127417L;

	private String id;// 主键
	private Date recordTime;// 记录时间
	private Integer spendingType;// 支出类型 0：其他、1：餐饮、2：交通、3：房租、4：娱乐、5：通讯、6：学习、7：购物
	private BigDecimal amountPaid;// 支出金额
	private String remark;// 备注
	private Date createTime;// 创建时间
	private String createUserId;// 创建人
	private Date updateTime;// 修改时间
	private String updateUserId;// 修改人

	@Id
 	@Column(name = "id" )
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

 	@Column(name = "record_time" )
	public Date getRecordTime() {
		return this.recordTime;
	}

	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}

 	@Column(name = "spending_type" )
	public Integer getSpendingType() {
		return this.spendingType;
	}

	public void setSpendingType(Integer spendingType) {
		this.spendingType = spendingType;
	}

 	@Column(name = "amount_paid" )
	public BigDecimal getAmountPaid() {
		return this.amountPaid;
	}

	public void setAmountPaid(BigDecimal amountPaid) {
		this.amountPaid = amountPaid;
	}

 	@Column(name = "remark" )
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

 	@Column(name = "create_time" )
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

 	@Column(name = "create_user_id" )
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

 	@Column(name = "update_time" )
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

 	@Column(name = "update_user_id" )
	public String getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

}
