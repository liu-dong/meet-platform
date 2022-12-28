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
@Table(name = "sys_login_logs")
public class LoginLogs implements Serializable {

	private static final long serialVersionUID = 3891338545767224610L;


	/**
	 * 主键id
	 */
	private String id;

	/**
	 * 登录账号
	 */
	private String account;

	/**
	 * 登录方式 （1：账号密码登录、2：邮箱快捷登录、3：扫码登录）
	 */
	private Long loginType;

	/**
	 * 登录时间
	 */
	private Date loginTime;

	/**
	 * 登录地点
	 */
	private String loginAddress;

	/**
	 * 登录IP
	 */
	private String loginIp;

	/**
	 * 备注
	 */
	private String remark;

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

	@Column(name = "login_type")
	public Long getLoginType() {
		return this.loginType;
	}

	public void setLoginType(Long loginType) {
		this.loginType = loginType;
	}

	@Column(name = "login_time")
	public Date getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	@Column(name = "login_address")
	public String getLoginAddress() {
		return this.loginAddress;
	}

	public void setLoginAddress(String loginAddress) {
		this.loginAddress = loginAddress;
	}

	@Column(name = "login_ip")
	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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
