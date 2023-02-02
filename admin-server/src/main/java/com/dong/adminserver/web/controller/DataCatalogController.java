package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.model.dto.DataCatalogDTO;
import com.dong.adminserver.web.service.DataCatalogService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 数据字典模块
 *
 * @author liudong
 */
@Api(tags = "数据字典模块")
@RestController
@RequestMapping("/dataCatalog")
public class DataCatalogController {

    @Autowired
    DataCatalogService dataCatalogService;

    /**
     * 查询数据字典目录列表
     *
     * @param dto   查询参数
     * @param pager 分页参数
     * @return 数据目录列表
     */
    @ApiOperation("查询数据字典目录列表")
    @PostMapping("/findDataCatalogList")
    public ResponseResult findDataCatalogList(DataCatalogDTO dto, Pager<DataCatalogDTO> pager) {
        try {
            return ResponseResult.success(dataCatalogService.findDataCatalogList(dto, pager), ResponseMessageConstant.QUERY_SUCCESS);
        } catch (Exception e) {
            return ResponseResult.error(e.getMessage());
        }
    }

    /**
     * 查询所有数据字典条目
     *
     * @return 返回数据目录编码与数据条目键值对
     */
    @ApiOperation("查询所有数据字典条目")
    @GetMapping("/findDataCatalogItemList")
    public ResponseResult findDataCatalogItemList() {
        try {
            Map<String, Object> dataCatalogItem = dataCatalogService.findDataCatalogItemList();
            return ResponseResult.success(dataCatalogItem, ResponseMessageConstant.QUERY_SUCCESS);
        } catch (Exception e) {
            return ResponseResult.error(e.getMessage());
        }
    }

    /**
     * 根据目录编码查询数据条目
     *
     * @param catalogCode
     * @return
     */
    @ApiOperation("根据目录编码查询数据条目")
    @GetMapping("/getDataCatalogItem")
    public ResponseResult getDataCatalogItem(String catalogCode) {
        try {
            List<Map<String, Object>> mapList = dataCatalogService.getDataCatalogItem(catalogCode);
            return ResponseResult.success(mapList, ResponseMessageConstant.QUERY_SUCCESS);
        } catch (Exception e) {
            return ResponseResult.error(e.getMessage());
        }
    }
}

