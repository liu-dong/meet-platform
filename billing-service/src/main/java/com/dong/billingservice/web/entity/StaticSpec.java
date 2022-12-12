package com.dong.billingservice.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 数据字典规格表 
 * 
 * @author liudong 2022/06/11 
 */
@Entity
@Table (name = "static_spec")
public class StaticSpec implements Serializable {

	private static final long serialVersionUID = 8954513742447046953L;

	private String id;// ID
	private String specCode;// 编码
	private String specName;// 名称
	private String specDesc;// 描述
	private String defaultValue;// 默认值
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

 	@Column(name = "spec_code" )
	public String getSpecCode() {
		return this.specCode;
	}

	public void setSpecCode(String specCode) {
		this.specCode = specCode;
	}

 	@Column(name = "spec_name" )
	public String getSpecName() {
		return this.specName;
	}

	public void setSpecName(String specName) {
		this.specName = specName;
	}

 	@Column(name = "spec_desc" )
	public String getSpecDesc() {
		return this.specDesc;
	}

	public void setSpecDesc(String specDesc) {
		this.specDesc = specDesc;
	}

 	@Column(name = "default_value" )
	public String getDefaultValue() {
		return this.defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
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
