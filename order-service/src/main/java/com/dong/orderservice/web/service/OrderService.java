package com.dong.orderservice.web.service;

import com.dong.orderservice.web.entity.OrderForm;
import com.dong.orderservice.web.model.Page;
import java.util.List;

public interface OrderService {

  void addOrder(OrderForm orderForm);

  void modOrder(OrderForm orderForm);

  OrderForm queryOrderById(String id);

  List<OrderForm> queryOrderList();

  void deleteOrderById(String id);

  Page<OrderForm> queryOrderListPage(int pageNum, int pageSize);

  List<OrderForm> queryOrderByArray(int pageNum, int pageSize);

  List<OrderForm> queryOrderBySql(int pageNum, int pageSize);

  List<OrderForm> queryOrderByPage(int pageNum, int pageSize);

  List<OrderForm> queryOrderByRowBounds(int pageNum, int pageSize);

}
