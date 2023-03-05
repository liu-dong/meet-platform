package com.dong.orderservice.web.service.impl;

import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.CurrentUserUtils;
import com.dong.orderservice.web.mapper.OrderMapper;
import com.dong.orderservice.web.entity.OrderForm;
import com.dong.orderservice.web.model.Page;
import com.dong.orderservice.web.model.PageParam;
import com.dong.orderservice.web.model.dto.OrderFormDTO;
import com.dong.orderservice.web.service.OrderService;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

  @Autowired
  private OrderMapper orderMapper;   // 这个报错的提示是 IDEA 的问题，和代码无关

  @Override
  public OrderForm saveOrder(OrderFormDTO dto) {
    OrderForm orderForm = convertEntity(dto);
    if (StringUtils.isEmpty(orderForm.getId())) {
      orderForm.setId(CommonUtils.getUUID());
      orderForm.setDeleteStatus(1);
      orderForm.setCreateTime(new Date());
      orderForm.setCreateUserId(CurrentUserUtils.getUserId());
      orderMapper.insertOrder(orderForm);
    }
    else {
      orderForm.setUpdateTime(new Date());
      orderForm.setUpdateUserId(CurrentUserUtils.getUserId());
      orderMapper.updateOrderById(orderForm);
    }
    return orderForm;
  }

  private OrderForm convertEntity(OrderFormDTO dto) {
    OrderForm entity = new OrderForm();
    entity.setId(dto.getId());
    entity.setOrderCode(dto.getOrderCode());
    entity.setOrderType(dto.getOrderType());
    entity.setOrderTime(dto.getOrderTime());
    entity.setOrderStatus(dto.getOrderStatus());
    entity.setReceiverId(dto.getReceiverId());
    entity.setReceiverName(dto.getReceiverName());
    entity.setReceiveAddress(dto.getReceiveAddress());
    entity.setShipperId(dto.getShipperId());
    entity.setShipperName(dto.getShipperName());
    entity.setShipAddress(dto.getShipAddress());
    entity.setOrderPrice(dto.getOrderPrice());
    return entity;
  }

  @Override
  public OrderForm getOrderById(String id) {
    return orderMapper.getOrderById(id);
  }

  @Override
  public List<OrderForm> getOrderList() {
    return orderMapper.getOrderList();
  }

  @Override
  public void deleteOrderById(String id) {
    orderMapper.deleteOrderById(id);
  }

  @Override
  public List<OrderForm> queryOrderByPage(int pageNum, int pageSize) {
    Map<String, Object> params = new HashMap<>(2);
    params.put("pageNum", pageNum);
    params.put("pageSize", pageSize);
    return orderMapper.queryOrderByPage(params);
  }

  @Override
  public List<OrderForm> getOrderPage(OrderFormDTO dto) {
    RowBounds rowBounds = PageParam.buildRowBounds(dto.getPageNum(), dto.getPageSize());
    return orderMapper.getOrderPage(rowBounds);
  }

}
