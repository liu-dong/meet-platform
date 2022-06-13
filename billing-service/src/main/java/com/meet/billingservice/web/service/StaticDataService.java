package com.dong.billingservice.web.service;

import com.dong.billingservice.web.model.StaticSpecDTO;

/**
 * 数据字典规格表(StaticSpec)服务接口
 *
 * @author zjx
 * @since 2022-06-11
 */
public interface StaticDataService {

  /**
   * 查询数据字典规格
   *
   * @param code 编码
   * @throws Exception 异常
   * @return 数据字典规格
   */
  StaticSpecDTO findStaticSpec(String code) throws Exception;

}
