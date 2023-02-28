package com.dong.orderservice.web.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dong.orderservice.web.entity.OrderProductRelation;
import java.util.List;

public interface OrderProductRelationService {

  void addRelation(OrderProductRelation orderForm);

  void modRelationById(OrderProductRelation orderForm);

  void modRelationByQuery(String productName);

  OrderProductRelation queryRelationById(String id);

  List<OrderProductRelation> queryRelationList();

  void deleteRelationById(String id);

  Page<OrderProductRelation> queryRelationByPage(int pageNum, int pageSize);

}
