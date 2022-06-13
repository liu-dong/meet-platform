package com.dong.billingservice.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 数据字典值表 
 * 
 * @author liudong 2022/06/11 
 */
@Entity
@Table (name = "static_value")
public class StaticValue implements Serializable {

	private static final long serialVersionUID = 4419836768505616202L;

	private String id;// ID
	private String specId;// 规格ID
	private String valueName;// 编码
	private String valueValue;// 名称
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

 	@Column(name = "spec_id" )
	public String getSpecId() {
		return this.specId;
	}

	public void setSpecId(String specId) {
		this.specId = specId;
	}

 	@Column(name = "value_name" )
	public String getValueName() {
		return this.valueName;
	}

	public void setValueName(String valueName) {
		this.valueName = valueName;
	}

 	@Column(name = "value_value" )
	public String getValueValue() {
		return this.valueValue;
	}

	public void setValueValue(String valueValue) {
		this.valueValue = valueValue;
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
