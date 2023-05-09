package com.dong.productservice.web.service.impl;

import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.NumberGenerationUtils;
import com.dong.productservice.es.dao.ESProductJpaDao;
import com.dong.productservice.es.entity.ESProduct;
import com.dong.productservice.web.dao.ProductJpaDao;
import com.dong.productservice.web.entity.Product;
import com.dong.productservice.web.model.ProductDTO;
import com.dong.productservice.web.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductJpaDao productJpaDao;
    @Autowired
    ESProductJpaDao esProductJpaDao;

    /**
     * 查询商品信息列表
     *
     * @param dto
     * @param limit
     * @param page
     * @return
     */
    @Override
    public List<Product> findProductList(ProductDTO dto, Integer limit, Integer page) {
        return productJpaDao.findAll();
    }

    /**
     * 保存商品信息
     *
     * @param dto
     * @return
     */
    @Transactional
    @Override
    public Product saveProduct(ProductDTO dto) {
        Product entity = new Product();
        if (StringUtils.isEmpty(dto.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
            entity.setProductCode(NumberGenerationUtils.getProductCode(String.valueOf(dto.getProductType())));//自动生成商品编号
        } else {
            entity = productJpaDao.findById(dto.getId()).orElse(new Product());
        }
        entity.setProductName(dto.getProductName());
        entity.setProductType(dto.getProductType());
        entity.setProductStatus(dto.getProductStatus());
        entity.setProductDescription(dto.getProductDescription());
        entity.setImageUrl(dto.getImageUrl());
        entity.setSellingPrice(dto.getSellingPrice());
        entity.setRemark(dto.getRemark());
        entity.setUpdateTime(new Date());
        entity = productJpaDao.save(entity);
        saveToES(entity);
        return entity;
    }

    private void saveToES(Product entity) {
        ESProduct esProduct = new ESProduct();
        BeanUtils.copyProperties(entity, esProduct);
        esProductJpaDao.save(esProduct);
    }

    /**
     * 查询商品信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public Product getProduct(String id) {
        ESProduct esProduct = esProductJpaDao.findById(id).orElse(null);
        if (esProduct != null) {
            Product product = new Product();
            BeanUtils.copyProperties(esProduct, product);
            return product;
        }
        return productJpaDao.getReferenceById(id);
    }

    /**
     * 删除商品信息
     *
     * @param id
     * @return
     */
    @Override
    public void deleteProduct(String id) {
        productJpaDao.deleteById(id);
    }

    @Override
    public Product updateProductCount(String productId, int productCount) {
        Product entity = productJpaDao.getByProductName(productId);
        entity = productJpaDao.save(entity);
        return entity;
    }

}
