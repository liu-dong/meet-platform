package com.dong.orderservice.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.orderservice.web.entity.OrderForm;
import com.dong.orderservice.web.model.dto.OrderFormDTO;
import com.dong.orderservice.web.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderController {

  @Autowired
  OrderService orderService;

  @PostMapping(value = "/saveOrder")
  public ResponseResult saveOrder(@RequestBody OrderFormDTO dto) {
    OrderForm orderForm = orderService.saveOrder(dto);
    return ResponseResult.success(orderForm, ResponseMessageConstant.SAVE_SUCCESS);
  }

  @GetMapping(value = "/getOrder")
  public ResponseResult getOrder(@RequestParam(value = "id") String id){
    return ResponseResult.success(orderService.getOrder(id), ResponseMessageConstant.QUERY_SUCCESS);
  }

  @GetMapping(value = "/findOrderList")
  public ResponseResult findOrderList(){
    return ResponseResult.success(orderService.findOrderList(), ResponseMessageConstant.QUERY_SUCCESS);
  }

  @PostMapping(value = "/deleteOrder")
  public ResponseResult deleteOrder(@RequestParam(value = "id") String id){
    orderService.deleteOrder(id);
    return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
  }

  @PostMapping(value = "/getOrderPage")
  public ResponseResult getOrderPage(@RequestBody OrderFormDTO dto){
    return ResponseResult.success(orderService.getOrderPage(dto), ResponseMessageConstant.QUERY_SUCCESS);
  }

}

