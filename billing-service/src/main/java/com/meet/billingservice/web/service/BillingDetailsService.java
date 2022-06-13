package com.meet.billingservice.web.service;

import com.meet.billingservice.web.entity.BillingDetails;
import com.meet.billingservice.web.model.BillingDetailsDTO;
import com.meet.billingservice.web.model.Pager;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

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
  BillingDetails saveBilling(BillingDetailsDTO dto) throws ParseException;

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
   * @param dto 查询参数
   * @param pager 分页参数
   * @return 账单明细列表
   */
  Pager<BillingDetailsDTO> findBillingList(BillingDetailsDTO dto, Pager<BillingDetailsDTO> pager);

  /**
   * 查询账单分组列表
   * @param dto 查询参数
   * @return 账单分组列表
   */
  Map<String, List<BillingDetailsDTO>> findBillingListGroup(BillingDetailsDTO dto);



}