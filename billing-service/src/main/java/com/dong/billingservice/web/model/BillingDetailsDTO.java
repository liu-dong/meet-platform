package com.dong.billingservice.web.model;

import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 账单明细
 *
 * @author zahng.jiaxin
 * @since 2022-05-28
 */
@Data
public class BillingDetailsDTO {

  /** 主键 */
  private String id;
  /** 记录时间 */
  private Date recordTime;
  /** 支出类型 0：其他、1：餐饮、2：交通、3：房租、4：娱乐、5：通讯、6：学习、7：购物 */
  private Integer spendingType;
  /** 支出金额 */
  private BigDecimal amountPaid;
  /** 备注 */
  private String remark;
  /** 创建时间 */
  private Date createTime;
  /** 创建人 */
  private String createUserId;
  /** 修改时间 */
  private Date updateTime;
  /** 修改人 */
  private String updateUserId;

}
