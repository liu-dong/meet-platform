package com.dong.adminserver.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 中国行政区划数据
 *
 * @author liudong 2022/12/28
 */
@Entity
@Table(name = "sys_administrative_division")
public class AdministrativeDivision implements Serializable {

	private static final long serialVersionUID = 87605718853473033L;


	/**
	 * 主键
	 */
	private Long id;

	/**
	 * 父区划代码
	 */
	private String parentCode;

	/**
	 * 区划代码
	 */
	private String divisionCode;

	/**
	 * 区划名称
	 */
	private String divisionName;

	/**
	 * 级别 1：省，2：市，3：区
	 */
	private Integer divisionType;

	@Id
	@Column(name = "id")
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "parent_code")
	public String getParentCode() {
		return this.parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	@Column(name = "division_code")
	public String getDivisionCode() {
		return this.divisionCode;
	}

	public void setDivisionCode(String divisionCode) {
		this.divisionCode = divisionCode;
	}

	@Column(name = "division_name")
	public String getDivisionName() {
		return this.divisionName;
	}

	public void setDivisionName(String divisionName) {
		this.divisionName = divisionName;
	}

	@Column(name = "division_type")
	public Integer getDivisionType() {
		return this.divisionType;
	}

	public void setDivisionType(Integer divisionType) {
		this.divisionType = divisionType;
	}

}
