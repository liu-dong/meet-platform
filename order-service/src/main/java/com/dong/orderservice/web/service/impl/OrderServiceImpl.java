package com.dong.orderservice.web.service.impl;

import com.dong.commoncore.util.CommonUtils;
import com.dong.orderservice.web.mapper.OrderMapper;
import com.dong.orderservice.web.entity.OrderForm;
import com.dong.orderservice.web.model.Page;
import com.dong.orderservice.web.model.PageParam;
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
  public void addOrder(OrderForm orderForm) {
    orderForm.setId(CommonUtils.getUUID());
    orderForm.setCreateTime(new Date());
    orderForm.setCreateUserId("1");
    orderMapper.insertOrder(orderForm);
  }

  @Override
  public void modOrder(OrderForm orderForm) {
    if (StringUtils.isEmpty(orderForm.getId())) {
      return;
    }
    orderForm.setUpdateTime(new Date());
    orderForm.setUpdateUserId("1");
    orderMapper.updateOrderById(orderForm);
  }

  @Override
  public OrderForm queryOrderById(String id) {
    OrderForm orderForm = orderMapper.queryOrderById(id);
    return orderForm;
  }

  @Override
  public List<OrderForm> queryOrderList() {
    return orderMapper.queryOrderList();
  }

  @Override
  public void deleteOrderById(String id) {
    orderMapper.deleteOrderById(id);
  }

  @Override
  public Page<OrderForm> queryOrderListPage(int pageNum, int pageSize) {
    int total = orderMapper.count();
    int offset = (pageNum - 1) * pageSize;
    List<OrderForm> orderForms = orderMapper.queryOrderBySql(offset, pageSize);
    System.out.println("orderForms" +orderForms);
    Page<OrderForm> page = new Page<>();
    page.setTotal(total);
    page.setListData(orderForms);
    page.setPageNum(pageNum);
    page.setPageSize(pageSize);
    page.setPages((int) Math.ceil(total * 1.0 / pageSize));
    return page;
  }

  @Override
  public List<OrderForm> queryOrderByArray(int pageNum, int pageSize) {
    List<OrderForm> orderForms = orderMapper.queryOrdersByArray();
    // 从第几条数据开始
    int fromIndex = (pageNum - 1) * pageSize;
    // 从第几条数据结束
    int toIndex = pageNum * pageSize;
    // 通过subList方法，获取到两个索引间的所有数据
    List<OrderForm> orderForms1 = orderForms.subList(fromIndex, toIndex);
    return orderForms1;
  }

  @Override
  public List<OrderForm> queryOrderBySql(int pageNum, int pageSize) {
    int offset = (pageNum - 1) * pageSize;
    return orderMapper.queryOrderBySql(offset, pageSize);
  }

  @Override
  public List<OrderForm> queryOrderByPage(int pageNum, int pageSize) {
    Map<String, Object> params = new HashMap<>();
    params.put("pageNum", pageNum);
    params.put("pageSize", pageSize);
    return orderMapper.queryOrderByPage(params);
  }

  @Override
  public List<OrderForm> queryOrderByRowBounds(int pageNum, int pageSize) {
    // Service层中侵入了持久层所使用的持久化技术的类或接口
    //RowBounds rowBounds = new RowBounds((pageNum - 1) * pageSize, pageSize);

    RowBounds rowBounds = PageParam.buildRowBounds(pageNum, pageSize);
    return orderMapper.queryOrderByRowBounds(rowBounds);
  }

}
