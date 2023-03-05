package com.dong.productservice.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.UploadDownloadUtils;
import com.dong.productservice.web.entity.Product;
import com.dong.productservice.web.model.ProductDTO;
import com.dong.productservice.web.service.ProductService;
import java.util.List;
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
     * @param dto
     * @param limit
     * @param page
     * @return
     */
    @PostMapping("/findProductList")
    public ResponseResult findProductList(ProductDTO dto, Integer limit, Integer page) {
        List<Product> productList = productService.findProductList(dto, limit, page);
        return ResponseResult.success(productList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存商品信息
     *
     * @param dto
     * @return
     */
    @PostMapping("/saveProduct")
    public ResponseResult saveProduct(@RequestBody ProductDTO dto) {
        Product product = productService.saveProduct(dto);
        return ResponseResult.success(product, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询商品信息
     *
     * @param id
     * @return
     */
    @GetMapping("/getProduct")
    public ResponseResult getProduct(String id) {
        Product product = productService.getProduct(id);
        return ResponseResult.success(product, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除商品信息
     *
     * @param id
     * @return
     */
    @PostMapping("/deleteProduct")
    public ResponseResult deleteProduct(String id) {
        productService.deleteProduct(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
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
