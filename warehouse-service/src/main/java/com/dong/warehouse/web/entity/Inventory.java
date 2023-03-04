package com.dong.warehouse.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
*  库存表
*
*  @author LD
*/
@Entity
@Table(name = "inventory")
public class Inventory implements Serializable {

    private static final long serialVersionUID = 4732901406385676495L;


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
    * 商品说明
    */
    private String productDescription;

    /**
    * 商品图片地址
    */
    private String imageUrl;

    /**
    * 商品总数
    */
    private Integer amount;

    /**
    * 剩余数量
    */
    private Integer remainingQuantity;

    /**
    * 成本价格
    */
    private BigDecimal costPrice;

    /**
    * 是否删除 0：否、1：是
    */
    private Integer deleteStatus;

    /**
    * 备注
    */
    private String remark;

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
    @Column(name = "id")
    public String getId(){
        return this.id;
    }

    public void setId(String id){
        this.id = id;
    }

    @Column(name = "product_name")
    public String getProductName(){
        return this.productName;
    }

    public void setProductName(String productName){
        this.productName = productName;
    }

    @Column(name = "product_code")
    public String getProductCode(){
        return this.productCode;
    }

    public void setProductCode(String productCode){
        this.productCode = productCode;
    }

    @Column(name = "product_type")
    public Integer getProductType(){
        return this.productType;
    }

    public void setProductType(Integer productType){
        this.productType = productType;
    }

    @Column(name = "product_description")
    public String getProductDescription(){
        return this.productDescription;
    }

    public void setProductDescription(String productDescription){
        this.productDescription = productDescription;
    }

    @Column(name = "image_url")
    public String getImageUrl(){
        return this.imageUrl;
    }

    public void setImageUrl(String imageUrl){
        this.imageUrl = imageUrl;
    }

    @Column(name = "amount")
    public Integer getAmount(){
        return this.amount;
    }

    public void setAmount(Integer amount){
        this.amount = amount;
    }

    @Column(name = "remaining_quantity")
    public Integer getRemainingQuantity(){
        return this.remainingQuantity;
    }

    public void setRemainingQuantity(Integer remainingQuantity){
        this.remainingQuantity = remainingQuantity;
    }

    @Column(name = "cost_price")
    public BigDecimal getCostPrice(){
        return this.costPrice;
    }

    public void setCostPrice(BigDecimal costPrice){
        this.costPrice = costPrice;
    }

    @Column(name = "delete_status")
    public Integer getDeleteStatus(){
        return this.deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus){
        this.deleteStatus = deleteStatus;
    }

    @Column(name = "remark")
    public String getRemark(){
        return this.remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }

    @Column(name = "create_time")
    public Date getCreateTime(){
        return this.createTime;
    }

    public void setCreateTime(Date createTime){
        this.createTime = createTime;
    }

    @Column(name = "create_user_id")
    public String getCreateUserId(){
        return this.createUserId;
    }

    public void setCreateUserId(String createUserId){
        this.createUserId = createUserId;
    }

    @Column(name = "update_time")
    public Date getUpdateTime(){
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime){
        this.updateTime = updateTime;
    }

    @Column(name = "update_user_id")
    public String getUpdateUserId(){
        return this.updateUserId;
    }

    public void setUpdateUserId(String updateUserId){
        this.updateUserId = updateUserId;
    }
}
