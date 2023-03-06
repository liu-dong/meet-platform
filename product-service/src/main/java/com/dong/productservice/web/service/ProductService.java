package com.dong.productservice.web.service;

import com.dong.productservice.web.entity.Product;
import com.dong.productservice.web.model.ProductDTO;

import java.util.List;

public interface ProductService {

    /**
     * 查询商品信息列表
     *
     * @param dto
     * @param limit
     * @param page
     * @return
     */
    List<Product> findProductList(ProductDTO dto, Integer limit, Integer page);

    /**
     * 保存商品信息
     *
     * @param dto
     * @return
     */
    Product saveProduct(ProductDTO dto);

    /**
     * 查询商品信息详细页面
     *
     * @param id
     * @return
     */
    Product getProduct(String id);

    /**
     * 删除商品信息
     *
     * @param id
     * @return
     */
    void deleteProduct(String id);

    /**
     * 修改商品的库存数量
     *
     * @param productId
     * @param productCount
     * @return
     */
    Product updateProductCount(String productId, int productCount);
}
