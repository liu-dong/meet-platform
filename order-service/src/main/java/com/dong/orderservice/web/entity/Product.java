package com.dong.orderservice.web.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * null 
 * 
 * @author liudong 2023/02/19 
 */
@Data
public class Product implements Serializable {

	private static final long serialVersionUID = 4337743820154090885L;

	private String id;// 主键id
	private String productName;// 商品名称
	private String productCode;// 商品编号
	private Integer productType;// 商品类型（0：其他、1：书籍、2：电子、3：服装）
	private Integer productStatus;// 商品状态（0：有货、1：缺货、2：下架）
	private String productDescription;// 商品说明
	private String imageUrl;// 商品图片地址
	private Long amount;// 商品总数
	private Long remainingQuantity;// 剩余数量
	private BigDecimal costPrice;// 成本价格
	private BigDecimal sellingPrice;// 出售价格
	private String remark;// 备注
	private Date createTime;// 创建时间
	private String createUserId;// 创建人id
	private Date updateTime;// 修改时间
	private String updateUserId;// 修改人id

}
