package com.dong.billingservice.web.service;

import com.dong.billingservice.web.entity.BillingDetails;
import com.dong.billingservice.web.model.BillingDetailsDTO;
import java.util.List;

/**
 * 账单明细表(BillingDetails)表服务接口
 *
 * @author makejava
 * @since 2022-05-28 00:18:54
 */
public interface BillingDetailsService {

  /**
   * 保存账单明细
   *
   * @param dto 账单内容
   * @return 账单内容
   */
  BillingDetails saveBilling(BillingDetailsDTO dto);

  /**
   * 查询账单明细
   *
   * @param id 主键
   * @throws Exception 异常
   * @return 账单内容
   */
  BillingDetails findBilling(String id) throws Exception;

  /**
   * 删除账单明细
   *
   * @param id 主键
   * @throws Exception 异常
   */
  void deleteBilling(String id) throws Exception;

  /**
   * 查询账单明细
   */
  List<BillingDetails> findBillingList();



}
