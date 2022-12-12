package com.dong.shardingspheredemo.web.service;

import com.dong.shardingspheredemo.web.entity.BillingDetails;
import com.dong.shardingspheredemo.web.model.BillingDetailsDTO;
import com.dong.commoncore.model.Pager;

import java.math.BigDecimal;
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

  /**
   * 统计账单月度各项支出
   *
   * @param date
   * @return
   */
  List<Map<String,Object>> statisticsBillingBySpendingType(String date);

  /**
   * 统计账单年度各月支出
   *
   * @param year
   * @return
   */
  Map<String, BigDecimal> statisticsBillingByMonth(String year);

  /**
   * 统计单项支出
   *
   * @param date
   * @return
   */
  Map<String, BigDecimal> statisticsBilling(String date);
}
