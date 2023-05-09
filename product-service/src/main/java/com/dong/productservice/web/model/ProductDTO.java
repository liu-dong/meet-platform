package com.dong.productservice.web.model;

import lombok.Data;

import java.math.BigDecimal;

/**
*  商品信息
*
*  @author LD
*/
@Data
public class ProductDTO {
    private String id;//主键id
    private String productName;//商品名称
    private String productCode;//商品编号
    private Integer productType;//商品类型（0：其他、1：书籍、2：电子、3：服装）
    private Integer productStatus;//商品状态（0：有货、1：缺货、2：下架）
    private String productDescription;//商品说明
    private String imageUrl;//商品说明
    private Integer amount;//商品总数
    private Integer remainingQuantity;//剩余数量
    private BigDecimal costPrice;//成本价格
    private BigDecimal sellingPrice;//出售价格
    private String remark;//备注

}
