package com.dong.billingservice.web.controller;

import com.dong.billingservice.web.entity.BillingDetails;
import com.dong.billingservice.web.model.BillingDetailsDTO;
import com.dong.billingservice.web.model.Pager;
import com.dong.billingservice.web.model.QueryParam;
import com.dong.billingservice.web.model.ResponseResult;
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
    public ResponseResult saveBillingDetails(@RequestBody BillingDetailsDTO dto) {
        BillingDetails billingDetails = billingDetailsService.saveBilling(dto);
        return ResponseResult.success(billingDetails, "保存成功！");
    }

    @ApiOperation("查询账单")
    @GetMapping("/getBilling")
    public ResponseResult getBilling(String id) {
        try {
            BillingDetails billing = billingDetailsService.findBilling(id);
            return ResponseResult.success(billing, "查询成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
    }

    @ApiOperation("删除账单")
    @PostMapping("/deleteBilling")
    public ResponseResult deleteBilling(String id) {
        try {
            billingDetailsService.deleteBilling(id);
            return ResponseResult.success("删除成功！");
        } catch (Exception e) {
            return ResponseResult.error(e.getMessage());
        }
    }

    @ApiOperation("查询分页列表")
    @PostMapping("/findBillingList")
    public ResponseResult findBillingList(@RequestBody BillingDetailsDTO dto, Pager<BillingDetailsDTO> pager) {
        try {
            return ResponseResult.success(billingDetailsService.findBillingList(dto, pager), "查询成功！");
        } catch (Exception e) {
            return ResponseResult.error(e.getMessage());
        }
    }

    @ApiOperation("查询分组列表")
    @PostMapping("/findBillingListGroup")
    public ResponseResult findBillingListGroup(@RequestBody BillingDetailsDTO dto) {
        try {
            return ResponseResult.success(billingDetailsService.findBillingListGroup(dto), "查询成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
    }


}

