package com.dong.productservice.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品表
 *
 * @author liudong 2023/05/09
 */
@Entity
@Table (name = "product")
public class Product implements Serializable {

	private static final long serialVersionUID = 634085090930843735L;


	/**
	 * 主键id
	 */
	private String id;

	/**
	 * 商品名称
	 */
	private String productName;

	/**
	 * 商品编号
	 */
	private String productCode;

	/**
	 * 商品类型（0：其他、1：书籍、2：电子、3：服装）
	 */
	private Integer productType;

	/**
	 * 商品状态（on_sale：在售，sold_out：下架）
	 */
	private Integer productStatus;

	/**
	 * 商品说明
	 */
	private String productDescription;

	/**
	 * 商品图片地址
	 */
	private String imageUrl;

	/**
	 * 出售价格
	 */
	private BigDecimal sellingPrice;

	/**
	 * 备注
	 */
	private String remark;

	/**
	 * 是否删除 0：否、1：是
	 */
	private Long isDetele;

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
 	@Column(name = "id" )
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

 	@Column(name = "product_name" )
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

 	@Column(name = "product_code" )
	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

 	@Column(name = "product_type" )
	public Integer getProductType() {
		return this.productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}

 	@Column(name = "product_status" )
	public Integer getProductStatus() {
		return this.productStatus;
	}

	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}

 	@Column(name = "product_description" )
	public String getProductDescription() {
		return this.productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

 	@Column(name = "image_url" )
	public String getImageUrl() {
		return this.imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

 	@Column(name = "selling_price" )
	public BigDecimal getSellingPrice() {
		return this.sellingPrice;
	}

	public void setSellingPrice(BigDecimal sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

 	@Column(name = "remark" )
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

 	@Column(name = "is_detele" )
	public Long getIsDetele() {
		return this.isDetele;
	}

	public void setIsDetele(Long isDetele) {
		this.isDetele = isDetele;
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
