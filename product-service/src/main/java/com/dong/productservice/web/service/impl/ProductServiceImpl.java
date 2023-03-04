package com.dong.productservice.web.service.impl;

import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.NumberGenerationUtils;
import com.dong.productservice.web.dao.ProductJpaDao;
import com.dong.productservice.web.entity.Product;
import com.dong.productservice.web.model.ProductBean;
import com.dong.productservice.web.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductJpaDao productJpaDao;

    /**
     * 查询商品信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @Override
    public ResponseResult findProductList(ProductBean bean, Integer limit, Integer page) {
        List<Product> productList = productJpaDao.findAll();
        return ResponseResult.success(productList, "查询成功");
    }

    /**
     * 保存商品信息
     *
     * @param bean
     * @return
     */
    @Override
    public ResponseResult saveProduct(ProductBean bean) {
        Product entity = new Product();
        if (StringUtils.isEmpty(bean.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
            entity.setProductCode(NumberGenerationUtils.getProductCode(String.valueOf(bean.getProductType())));//自动生成商品编号
        } else {
            entity = productJpaDao.getOne(bean.getId());
        }
        entity.setProductName(bean.getProductName());
        entity.setProductType(bean.getProductType());
        entity.setProductStatus(bean.getProductStatus());
        entity.setProductDescription(bean.getProductDescription());
        entity.setImageUrl(bean.getImageUrl());
        entity.setAmount(bean.getAmount());
        entity.setRemainingQuantity(bean.getRemainingQuantity());
        entity.setCostPrice(bean.getCostPrice());
        entity.setSellingPrice(bean.getSellingPrice());
        entity.setRemark(bean.getRemark());
        entity.setUpdateTime(new Date());
        entity = productJpaDao.save(entity);
        return ResponseResult.success(entity, "保存成功!");
    }

    /**
     * 查询商品信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult getProduct(String id) {
        if (!StringUtils.isEmpty(id)) {
            Product entity = productJpaDao.getOne(id);
            return ResponseResult.success(entity, "查询成功!");
        }
        return ResponseResult.error("查询失败，id不能为空!");
    }

    /**
     * 删除商品信息
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult deleteProduct(String id) {
        if (!StringUtils.isEmpty(id)) {
            productJpaDao.deleteById(id);
            return ResponseResult.success("删除成功!");
        }
        return ResponseResult.error("删除失败，id不能为空!");
    }

    @Override
    public ResponseResult updateProductCount(String productId, int productCount) {
//      Product entity = productJpaDao.getOne(productId);
        Product entity = productJpaDao.getByProductName(productId);
        entity.setRemainingQuantity(entity.getRemainingQuantity() + productCount);
        entity = productJpaDao.save(entity);
        return ResponseResult.success(entity, "修改成功!");
    }

}
