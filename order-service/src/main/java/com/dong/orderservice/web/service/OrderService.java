package com.dong.orderservice.web.service;

import com.dong.orderservice.web.entity.OrderForm;
import com.dong.orderservice.web.model.Page;
import com.dong.orderservice.web.model.dto.OrderFormDTO;
import java.util.List;

public interface OrderService {

  OrderForm saveOrder(OrderFormDTO dto);

  OrderForm getOrderById(String id);

  List<OrderForm> getOrderList();

  void deleteOrderById(String id);

  List<OrderForm> queryOrderByPage(int pageNum, int pageSize);

  List<OrderForm> getOrderPage(OrderFormDTO dto);

}
