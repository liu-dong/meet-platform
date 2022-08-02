package com.meet.authserver.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 数据字典条目表 
 * 
 * @author liudong 2022/08/02 
 */
@Entity
@Table (name = "data_catalog_item")
public class DataCatalogItem implements Serializable {

	private static final long serialVersionUID = 3091289218531080340L;

	/**  主键 */
	private String id;
	/**  目录id */
	private String catalogId;
	/**  条目编码 */
	private String itemCode;
	/**  条目名称 */
	private String itemName;
	/**  排序 */
	private Integer sort;
	/**  状态 0：禁用，1：启用 */
	private Integer stauts;
	/**  备注 */
	private String remark;
	/**  创建时间 */
	private Date createTime;
	/**  创建人 */
	private String createUserId;
	/**  修改时间 */
	private Date updateTime;
	/**  修改人 */
	private String updateUserId;

	@Id
 	@Column(name = "id" )
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

 	@Column(name = "catalog_id" )
	public String getCatalogId() {
		return this.catalogId;
	}

	public void setCatalogId(String catalogId) {
		this.catalogId = catalogId;
	}

 	@Column(name = "item_code" )
	public String getItemCode() {
		return this.itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

 	@Column(name = "item_name" )
	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

 	@Column(name = "sort" )
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

 	@Column(name = "stauts" )
	public Integer getStauts() {
		return this.stauts;
	}

	public void setStauts(Integer stauts) {
		this.stauts = stauts;
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
