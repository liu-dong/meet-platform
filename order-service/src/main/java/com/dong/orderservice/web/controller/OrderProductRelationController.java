package com.dong.orderservice.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.orderservice.web.entity.OrderProductRelation;
import com.dong.orderservice.web.service.OrderProductRelationService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zhang.jiaxin
 * @since 2023/2/21
 */
@RestController
public class OrderProductRelationController {

  @Autowired
  OrderProductRelationService orderProductRelationService;

  @PostMapping(value = "/addRelation")
  public ResponseResult addRelation(@RequestBody OrderProductRelation orderProductRelation) {
    orderProductRelationService.addRelation(orderProductRelation);
    return ResponseResult.success("新增成功");
  }

  @PostMapping(value = "/modRelationById")
  public ResponseResult modRelationById(@RequestBody OrderProductRelation orderProductRelation) {
    if (StringUtils.isEmpty(orderProductRelation.getId())) {
      return ResponseResult.error("修改时主键不能为空");
    }
    orderProductRelationService.modRelationById(orderProductRelation);
    return ResponseResult.success("修改成功");
  }

  @PostMapping(value = "/modRelationByQuery")
  public ResponseResult modRelationByQuery(@RequestParam String productName) {
    orderProductRelationService.modRelationByQuery(productName);
    return ResponseResult.success("修改成功");
  }

  @GetMapping(value = "/queryRelationById")
  public ResponseResult queryRelationById(@RequestParam(value = "id") String id){
    return ResponseResult.success(orderProductRelationService.queryRelationById(id), "");
  }

  @GetMapping(value = "/queryRelationList")
  public ResponseResult queryRelationList(){
    return ResponseResult.success(orderProductRelationService.queryRelationList(), "");
  }

  @GetMapping(value = "/deleteRelationById")
  public ResponseResult deleteRelationById(@RequestParam(value = "id") String id){
    orderProductRelationService.deleteRelationById(id);
    return ResponseResult.success("删除成功");
  }

  @PostMapping(value = "/queryRelationByPage")
  public ResponseResult queryRelationByPage(@RequestParam int pageNum, @RequestParam int pageSize){
    return ResponseResult.success(orderProductRelationService.queryRelationByPage(pageNum, pageSize), "");
  }

}
