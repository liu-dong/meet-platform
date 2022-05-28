package com.dong.billingservice.web.controller;

import com.dong.billingservice.web.entity.BillingDetails;
import com.dong.billingservice.web.model.BillingDetailsDTO;
import com.dong.billingservice.web.service.BillingDetailsService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 账单明细表(BillingDetails)表控制层
 *
 * @author makejava
 * @since 2022-05-28 00:18:49
 */
@RestController
@RequestMapping("/billingDetails")
public class BillingDetailsController {

  @Autowired
  private BillingDetailsService billingDetailsService;

  @ApiOperation("保存账单")
  @PostMapping("/saveBillingDetails")
  public BillingDetails saveBillingDetails(BillingDetailsDTO dto) {
    return billingDetailsService.saveBilling(dto);
  }

  @ApiOperation("查询账单")
  @GetMapping("/findBilling")
  public BillingDetails findBilling(String id) {
    try {
      billingDetailsService.findBilling(id);
    }
    catch (Exception e) {
      e.getMessage();
    }
    return null;
  }

  public void deleteBilling(String id) {
    try {
      billingDetailsService.deleteBilling(id);
    }
    catch (Exception e) {
      e.getMessage();
    }
  }


}

