package com.dong.billingservice.web.service.impl;

import com.dong.billingservice.web.dao.BillingDetailsJpaDao;
import com.dong.billingservice.web.entity.BillingDetails;
import com.dong.billingservice.web.model.BillingDetailsDTO;
import com.dong.billingservice.web.service.BillingDetailsService;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 账单明细表(BillingDetails)表服务实现类
 *
 * @author zhangjiaxin
 * @since 2022-05-28 00:18:54
 */
@Service
public class BillingDetailsServiceImpl implements BillingDetailsService {

  @Autowired
  private BillingDetailsJpaDao billingDetailsJpaDao;

  @Override
  public BillingDetails saveBilling(BillingDetailsDTO dto) {
    BillingDetails billingDetails = convertEntity(dto);
    billingDetailsJpaDao.save(billingDetails);
    return billingDetails;
  }

  @Override
  public BillingDetails findBilling(String id) throws Exception {
    if (StringUtils.isEmpty(id)) {
        throw new Exception("主键不能为空");
    }
    return billingDetailsJpaDao.getOne(id);
  }

  @Override
  public void deleteBilling(String id) throws Exception {
    if (StringUtils.isEmpty(id)) {
      throw new Exception("主键不能为空");
    }
    billingDetailsJpaDao.deleteById(id);
  }

  @Override
  public List<BillingDetails> findBillingList() {
    return null;
  }

  private BillingDetails convertEntity(BillingDetailsDTO dto) {
    BillingDetails entity = new BillingDetails();
    if (StringUtils.isEmpty(dto.getId())) {
      entity.setId(UUID.randomUUID().toString());
      entity.setCreateTime(new Date());
    }
    else {
      entity = billingDetailsJpaDao.getOne(dto.getId());
    }
    entity.setSpendingType(dto.getSpendingType());
    entity.setAmountPaid(dto.getAmountPaid());
    entity.setRemark(dto.getRemark());
    entity.setRecordTime(new Date());
    entity.setUpdateTime(new Date());
    return entity;
  }

}
