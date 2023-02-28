package com.dong.orderservice.web.mapper;

import com.dong.orderservice.web.entity.OrderForm;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

@Mapper
public interface OrderMapper {

  int insertOrder(OrderForm orderForm);

  int updateOrderById(OrderForm orderForm);

  OrderForm queryOrderById(String id);

  List<OrderForm> queryOrderList();

  int deleteOrderById(String id);

  int count();

  /**
   * 借助数组进行分页
   * @return
   */
  List<OrderForm> queryOrdersByArray();

  /**
   * 借助 SQL 进行分页
   * @return
   */
  List<OrderForm> queryOrderBySql(int offset, int pageSize);

  /**
   * 拦截器进行分页
   * @return
   */
  List<OrderForm> queryOrderByPage(Map<String, Object> params);

  /**
   * RowBounds 实现分页
   * @return
   */
  List<OrderForm> queryOrderByRowBounds(RowBounds rowBounds);

}
