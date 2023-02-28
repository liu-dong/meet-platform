package com.dong.orderservice.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dong.commoncore.util.CommonUtils;
import com.dong.orderservice.web.entity.OrderProductRelation;
import com.dong.orderservice.web.mapper.OrderProductRelationMapper;
import com.dong.orderservice.web.service.OrderProductRelationService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderProductRelationServiceImpl implements OrderProductRelationService {

  @Autowired
  OrderProductRelationMapper orderProductRelationMapper;

  @Override
  public void addRelation(OrderProductRelation orderForm) {
    orderForm.setId(CommonUtils.getUUID());
    orderForm.setCreateTime(new Date());
    orderProductRelationMapper.insert(orderForm);
  }

  @Override
  public void modRelationById(OrderProductRelation orderForm) {
    orderForm.setUpdateTime(new Date());
    orderProductRelationMapper.updateById(orderForm);
  }

  @Override
  public void modRelationByQuery(String productName) {

    //修改条件构造器 UpdateWrapper，存在许多硬编码
//    OrderProductRelation relation = new OrderProductRelation();
//    UpdateWrapper<OrderProductRelation> updateWrapper = new UpdateWrapper<>();
//    updateWrapper.eq("product_name", "编程思想")
//        .set("product_name", productName);

    OrderProductRelation relation = new OrderProductRelation();
    LambdaUpdateWrapper<OrderProductRelation> updateWrapper = new LambdaUpdateWrapper<>();
    updateWrapper.eq(OrderProductRelation::getProductName, "sss")
        .set(OrderProductRelation::getRemark, productName)
    .set(OrderProductRelation::getUpdateTime, new Date());
    orderProductRelationMapper.update(relation, updateWrapper);
  }

  @Override
  public OrderProductRelation queryRelationById(String id) {
    return orderProductRelationMapper.selectById(id);
  }

  @Override
  public List<OrderProductRelation> queryRelationList() {
    //查询条件构造器QueryWrapper，存在许多硬编码
//    QueryWrapper<OrderProductRelation> queryWrapper = new QueryWrapper<>();
//    queryWrapper.eq("product_name", "联想笔记本Y9000").
//        or().eq("product_id", "6b262ab034f34eb7b9b0d65bdc3d41f2")
//    .like("order_code", "aa");

    LambdaQueryWrapper<OrderProductRelation> queryWrapper = new LambdaQueryWrapper<>();
    queryWrapper.eq(OrderProductRelation::getProductName, "联想笔记本Y9000").
        or().eq(OrderProductRelation::getProductId, "6b262ab034f34eb7b9b0d65bdc3d41f2")
        .like(OrderProductRelation::getOrderCode, "20210114230");
    return orderProductRelationMapper.selectList(queryWrapper);
  }

  @Override
  public void deleteRelationById(String id) {
    orderProductRelationMapper.deleteById(id);
  }

    @Override
    public Page<OrderProductRelation> queryRelationByPage(int pageNum, int pageSize) {
      LambdaQueryWrapper<OrderProductRelation> queryWrapper = new LambdaQueryWrapper<>();
      queryWrapper.eq(OrderProductRelation::getProductName, "如何阅读一本书").orderByDesc(OrderProductRelation::getCreateTime);
      Page<OrderProductRelation> pageParam = new Page<>(pageNum, pageSize);
      Page<OrderProductRelation> relationPage = orderProductRelationMapper.selectPage(pageParam, queryWrapper);
      return relationPage;
    }
}
