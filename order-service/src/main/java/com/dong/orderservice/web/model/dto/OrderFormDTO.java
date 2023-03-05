package com.dong.orderservice.web.model.dto;

import com.dong.orderservice.web.entity.OrderForm;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * @author zhang.jiaxin
 * @since 2023/3/4
 */
@Data
public class OrderFormDTO {

  private static final long serialVersionUID = 1L;

  private String id;// null
  private String orderCode;// 订单编号
  private Integer orderType;// 订单类型（1、出货单、2、退货单）
  private Date orderTime;// 下单时间
  private Integer orderStatus;// 订单状态（1：待接单、2：待发货、3：待收货、4：待签收、5已签收）
  private String receiverId;// 收货人id
  private String receiverName;// 收货人名称
  private String receiveAddress;// 收货地址
  private String shipperId;// 发货人id
  private String shipperName;// 发货人名称
  private String shipAddress;// 发货地址
  private BigDecimal orderPrice;// 订单金额
  private String remark;// 备注
  private Date createTime;// 创建时间
  private String createUserId;// 创建人id
  private Date updateTime;// 修改时间
  private String updateUserId;// 修改人id

  private int pageNum;// 分页
  private int pageSize;// 分页

}
