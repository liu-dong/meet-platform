package com.dong.productservice.web.model;

import java.math.BigDecimal;

/**
*  商品信息
*
*  @author LD
*/
public class ProductDTO {
    private String id;//主键id
    private String productName;//商品名称
    private String productCode;//商品编号
    private Short productType;//商品类型（0：其他、1：书籍、2：电子、3：服装）
    private Short productStatus;//商品状态（0：有货、1：缺货、2：下架）
    private String productDescription;//商品说明
    private String imageUrl;//商品说明
    private Integer amount;//商品总数
    private Integer remainingQuantity;//剩余数量
    private BigDecimal costPrice;//成本价格
    private BigDecimal sellingPrice;//出售价格
    private String remark;//备注


    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return this.id;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return this.productName;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductCode() {
        return this.productCode;
    }

    public void setProductType(Short productType) {
        this.productType = productType;
    }

    public short getProductType() {
        return this.productType;
    }

    public void setProductStatus(Short productStatus) {
        this.productStatus = productStatus;
    }

    public Short getProductStatus() {
        return this.productStatus;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductDescription() {
        return this.productDescription;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getAmount() {
        return this.amount;
    }

    public void setRemainingQuantity(Integer remainingQuantity) {
        this.remainingQuantity = remainingQuantity;
    }

    public Integer getRemainingQuantity() {
        return this.remainingQuantity;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public BigDecimal getCostPrice() {
        return this.costPrice;
    }

    public void setSellingPrice(BigDecimal sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public BigDecimal getSellingPrice() {
        return this.sellingPrice;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return this.remark;
    }
}
