package com.dong.productservice.web.service;

import com.dong.commoncore.model.ResponseResult;
import com.dong.productservice.web.model.ProductBean;

public interface ProductService {

    /**
     * 查询商品信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findProductList(ProductBean bean, Integer limit, Integer page);

    /**
     * 保存商品信息
     *
     * @param bean
     * @return
     */
    ResponseResult saveProduct(ProductBean bean);

    /**
     * 查询商品信息详细页面
     *
     * @param id
     * @return
     */
    ResponseResult getProduct(String id);

    /**
     * 删除商品信息
     *
     * @param id
     * @return
     */
    ResponseResult deleteProduct(String id);

    /**
     * 修改商品的库存数量
     * @param productId
     * @param productCount
     * @return
     */
    ResponseResult updateProductCount(String productId, int productCount);
}
