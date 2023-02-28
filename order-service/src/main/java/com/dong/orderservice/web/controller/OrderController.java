package com.dong.orderservice.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.orderservice.web.entity.OrderForm;
import com.dong.orderservice.web.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

//@Controller
//@ResponseBody
@RestController
public class OrderController {

  @Autowired
  OrderService orderService;

/*  {
    "orderCode": "zhang",
      "orderType":"1",
      "orderStatus":"1",
      "receiverId":"123",
      "receiverName":"zhangjiaxin"
  }*/
  @PostMapping(value = "/addOrder")
  public ResponseResult addOrder(@RequestBody OrderForm orderForm) {
    orderService.addOrder(orderForm);
    return ResponseResult.success("新增成功");
  }

  @PostMapping(value = "/modOrder")
  public ResponseResult modOrder(@RequestBody OrderForm orderForm) {
    if (StringUtils.isEmpty(orderForm.getId())) {
      return ResponseResult.error("修改时主键不能为空");
    }
    orderService.modOrder(orderForm);
    return ResponseResult.success("修改成功");
  }

  @GetMapping(value = "/queryOrderById")
  public ResponseResult queryOrderById(@RequestParam(value = "id") String id){
    return ResponseResult.success(orderService.queryOrderById(id), "查询成功");
  }

  @GetMapping(value = "/queryOrderList")
  public ResponseResult queryOrderList(){
    return ResponseResult.success(orderService.queryOrderList(), "查询成功");
  }

  @GetMapping(value = "/deleteOrderById")
  public ResponseResult deleteOrderById(@RequestParam(value = "id") String id){
    orderService.deleteOrderById(id);
    return ResponseResult.success("删除成功");
  }

  @GetMapping(value = "/queryOrderListPage")
  public ResponseResult queryOrderListPage(@RequestParam int pageNum, @RequestParam int pageSize){
    return ResponseResult.success(orderService.queryOrderListPage(pageNum, pageSize), "查询成功");
  }

  // 借助数组进行分页
  @GetMapping(value = "/queryOrderByArray")
  public ResponseResult queryOrderByArray(@RequestParam int pageNum, @RequestParam int pageSize){
    return ResponseResult.success(orderService.queryOrderByArray(pageNum, pageSize), "");
  }

  @GetMapping(value = "/queryOrderBySql")
  public ResponseResult queryOrderBySql(@RequestParam int pageNum, @RequestParam int pageSize){
    return ResponseResult.success(orderService.queryOrderBySql(pageNum, pageSize), "");
  }

  @GetMapping(value = "/queryOrderByPage")
  public ResponseResult queryOrderByPage(@RequestParam int pageNum, @RequestParam int pageSize){
    return ResponseResult.success(orderService.queryOrderByPage(pageNum, pageSize), "");
  }

  @GetMapping(value = "/queryOrderByRowBounds")
  public ResponseResult queryOrderByRowBounds(@RequestParam int pageNum, @RequestParam int pageSize){
    return ResponseResult.success(orderService.queryOrderByRowBounds(pageNum, pageSize), "");
  }

}

