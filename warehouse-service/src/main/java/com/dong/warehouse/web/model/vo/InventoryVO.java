package com.dong.warehouse.web.model.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
*  库存表
*
*  @author LD
*/
@Data
public class InventoryVO {

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

}
