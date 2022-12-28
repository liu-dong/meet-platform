package com.dong.logserver.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 登录日志表
 *
 * @author liudong 2022/12/28
 */
@Entity
@Table(name = "sys_operate_logs")
public class OperateLogs implements Serializable {

	private static final long serialVersionUID = 2262232968172802898L;


	/**
	 * 主键id
	 */
	private String id;

	/**
	 * 操作账号
	 */
	private String account;

	/**
	 * 操作类型 （add：新增、delete：删除、update：修改、select：查询）
	 */
	private String operateType;

	/**
	 * 操作时间
	 */
	private Date operateTime;

	/**
	 * 模块名称
	 */
	private String moduleName;

	/**
	 * 模块编码
	 */
	private String moduleCode;

	/**
	 * 操作对象
	 */
	private String operateObject;

	/**
	 * 登录IP
	 */
	private String loginIp;

	/**
	 * 操作内容
	 */
	private String content;

	private Date createTime;

	private Date updateTime;

	@Id
	@Column(name = "id")
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "account")
	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "operate_type")
	public String getOperateType() {
		return this.operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

	@Column(name = "operate_time")
	public Date getOperateTime() {
		return this.operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}

	@Column(name = "module_name")
	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	@Column(name = "module_code")
	public String getModuleCode() {
		return this.moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	@Column(name = "operate_object")
	public String getOperateObject() {
		return this.operateObject;
	}

	public void setOperateObject(String operateObject) {
		this.operateObject = operateObject;
	}

	@Column(name = "login_ip")
	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	@Column(name = "content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "create_time")
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_time")
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
