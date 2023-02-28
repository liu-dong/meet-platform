package com.dong.orderservice.web.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 订单商品关联表
 *
 * @author liudong 2023/02/19
 */
@Data
@TableName("order_product_relation")
public class OrderProductRelation implements Serializable {

  private static final long serialVersionUID = 75507349583325343L;

  @TableId(value = "id")
  private String id;// 主键id

  @TableField(value = "order_id")
  private String orderId;// 订单id

//  @TableField(value = "order_code")
  private String orderCode;// 订单编号

//  @TableField(value = "product_id")
  private String productId;// 商品id

  @TableField(value = "product_name")
  private String productName;// 商品名称

  @TableField(value = "product_price")
  private BigDecimal productPrice;// 商品价格

  @TableField(value = "product_count")
  private Long productCount;// 商品数量

  private String remark;// 备注

  @TableField(value = "create_time")
  private Date createTime;// 创建时间

  @TableField(value = "update_time")
  private Date updateTime;// 修改时间

}
