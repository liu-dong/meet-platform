package com.dong.productservice.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.UploadDownloadUtils;
import com.dong.productservice.web.model.ProductBean;
import com.dong.productservice.web.service.ProductService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

/**
 * 商品信息管理
 *
 * @author LD
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * 查询商品信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @PostMapping("/findProductList")
    public ResponseResult findProductList(ProductBean bean, Integer limit, Integer page) {
        return productService.findProductList(bean, limit, page);
    }

    /**
     * 保存商品信息
     *
     * @param bean
     * @return
     */
    @PostMapping("/saveProduct")
    public ResponseResult saveProduct(@RequestBody ProductBean bean) {
        return productService.saveProduct(bean);
    }

    /**
     * 查询商品信息
     *
     * @param id
     * @return
     */
    @GetMapping("/getProduct")
    public ResponseResult getProduct(String id) {
        return productService.getProduct(id);
    }

    /**
     * 删除商品信息
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteProduct")
    public ResponseResult deleteProduct(String id) {
        return productService.deleteProduct(id);
    }

    /**
     * 上传附件到本地 (transferTo)
     *
     * @param file
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @RequestMapping("/upload")
    public ResponseResult upload(MultipartFile file) throws IllegalStateException, IOException {
        Map<String, Object> map = UploadDownloadUtils.uploadFirst(file,"E:\\MyProject\\mySpringCloud\\ui\\public\\images");
        return ResponseResult.success(map,"请求成功！");
    }
}
