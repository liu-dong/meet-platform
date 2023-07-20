package com.dong.plan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 计划表
 *
 * @author liudong 2023/07/20
 */
@Entity
@Table (name = "plan")
public class Plan implements Serializable {

	private static final long serialVersionUID = 4527867390639428604L;


	/**
	 * 主键id
	 */
	private String id;

	/**
	 * 计划编码
	 */
	private String planCode;

	/**
	 * 计划名称
	 */
	private String planName;

	/**
	 * 计划类型 day：日计划、week：周计划、month：月计划，year：年计划
	 */
	private String planType;

	/**
	 * 计划目标
	 */
	private String planTarget;

	/**
	 * 计划内容
	 */
	private String planContent;

	/**
	 * 计划状态 1：未开始，2：进行中，3：已完成，4：延期
	 */
	private Long planStatus;

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

	/**
	 * 删除状态：0 未删除、1 已删除
	 */
	private Long deleteStatus;

	@Id
 	@Column(name = "id" )
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

 	@Column(name = "plan_code" )
	public String getPlanCode() {
		return this.planCode;
	}

	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}

 	@Column(name = "plan_name" )
	public String getPlanName() {
		return this.planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

 	@Column(name = "plan_type" )
	public String getPlanType() {
		return this.planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

 	@Column(name = "plan_target" )
	public String getPlanTarget() {
		return this.planTarget;
	}

	public void setPlanTarget(String planTarget) {
		this.planTarget = planTarget;
	}

 	@Column(name = "plan_content" )
	public String getPlanContent() {
		return this.planContent;
	}

	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}

 	@Column(name = "plan_status" )
	public Long getPlanStatus() {
		return this.planStatus;
	}

	public void setPlanStatus(Long planStatus) {
		this.planStatus = planStatus;
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

 	@Column(name = "delete_status" )
	public Long getDeleteStatus() {
		return this.deleteStatus;
	}

	public void setDeleteStatus(Long deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

}
