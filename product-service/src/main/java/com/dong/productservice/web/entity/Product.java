package com.dong.productservice.web.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author LD
 * @date 2020/10/14 0:15
 */
@Entity
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class Product {
    private String id;
    private String productName;
    private String productCode;
    private short productType;
    private short productStatus;
    private String productDescription;
    private String imageUrl;
    private int amount;
    private int remainingQuantity;
    private BigDecimal costPrice;
    private BigDecimal sellingPrice;
    private String remark;
    private Date createTime;
    private String createUserId;
    private Date updateTime;
    private String updateUserId;

    @Id
    @Column(name = "id", nullable = false, length = 36)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "product_name", nullable = false, length = 50)
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Basic
    @Column(name = "product_code", nullable = false, length = 10)
    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    @Basic
    @Column(name = "product_type", nullable = false)
    public short getProductType() {
        return productType;
    }

    public void setProductType(short productType) {
        this.productType = productType;
    }

    @Basic
    @Column(name = "product_status", nullable = false)
    public short getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(short productStatus) {
        this.productStatus = productStatus;
    }

    @Basic
    @Column(name = "product_description", nullable = true, length = 2000)
    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    @Basic
    @Column(name = "image_url", nullable = true, length = 255)
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Basic
    @Column(name = "amount", nullable = false)
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "remaining_quantity", nullable = false)
    public int getRemainingQuantity() {
        return remainingQuantity;
    }

    public void setRemainingQuantity(int remainingQuantity) {
        this.remainingQuantity = remainingQuantity;
    }

    @Basic
    @Column(name = "cost_price", nullable = true, precision = 2)
    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    @Basic
    @Column(name = "selling_price", nullable = true, precision = 2)
    public BigDecimal getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(BigDecimal sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    @Basic
    @Column(name = "remark", nullable = true, length = 1000)
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {return true;}
        if (o == null || getClass() != o.getClass()) {return false;}

        Product product = (Product) o;

        if (productType != product.productType) {return false;}
        if (productStatus != product.productStatus) {return false;}
        if (amount != product.amount) {return false;}
        if (remainingQuantity != product.remainingQuantity) {return false;}
        if (id != null ? !id.equals(product.id) : product.id != null) {return false;}
        if (productName != null ? !productName.equals(product.productName) : product.productName != null) {return false;}
        if (productCode != null ? !productCode.equals(product.productCode) : product.productCode != null) {return false;}
        if (productDescription != null ? !productDescription.equals(product.productDescription) : product.productDescription != null)
            {return false;}
        if (costPrice != null ? !costPrice.equals(product.costPrice) : product.costPrice != null) {return false;}
        if (sellingPrice != null ? !sellingPrice.equals(product.sellingPrice) : product.sellingPrice != null)
            {return false;}
        if (remark != null ? !remark.equals(product.remark) : product.remark != null) {return false;}

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (productCode != null ? productCode.hashCode() : 0);
        result = 31 * result + (int) productType;
        result = 31 * result + (int) productStatus;
        result = 31 * result + (productDescription != null ? productDescription.hashCode() : 0);
        result = 31 * result + amount;
        result = 31 * result + remainingQuantity;
        result = 31 * result + (costPrice != null ? costPrice.hashCode() : 0);
        result = 31 * result + (sellingPrice != null ? sellingPrice.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "create_user_id")
    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Basic
    @Column(name = "update_time")
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "update_user_id")
    public String getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }
}
