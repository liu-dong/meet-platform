package com.dong.admin.web.controller;

import com.dong.admin.web.model.dto.DataCatalogDTO;
import com.dong.admin.web.model.vo.DataCatalogVO;
import com.dong.admin.web.model.vo.SelectItemVO;
import com.dong.admin.web.service.DataCatalogService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 数据字典管理
 *
 * @author liudong
 */
@Api(tags = "数据字典管理")
@RestController
@RequestMapping("/dataCatalog")
public class DataCatalogController {

    @Autowired
    DataCatalogService dataCatalogService;

    /**
     * 查询数据字典目录列表
     *
     * @param dto        查询参数
     * @param pagination 分页参数
     * @return 数据目录列表
     */
    @ApiOperation("查询数据字典目录列表")
    @GetMapping("/findDataCatalogList")
    public ResponseResult<PageVO<DataCatalogVO>> findDataCatalogList(DataCatalogDTO dto, Pagination pagination) {
        return ResponseResult.success(dataCatalogService.findDataCatalogList(dto, pagination), ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询所有数据字典条目
     *
     * @return 返回数据目录编码与数据条目键值对
     */
    @ApiOperation("查询所有数据字典条目")
    @GetMapping("/findDataCatalogItemList")
    public ResponseResult<Map<String, Object>> findDataCatalogItemList() {
        Map<String, Object> dataCatalogItem = dataCatalogService.findDataCatalogItemList();
        return ResponseResult.success(dataCatalogItem, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 根据目录编码查询数据条目
     *
     * @param catalogCode
     * @return
     */
    @ApiOperation("根据目录编码查询数据条目")
    @GetMapping("/getDataCatalogItem")
    public ResponseResult<List<SelectItemVO>> getDataCatalogItem(String catalogCode) {
        List<SelectItemVO> selectItemVOList = dataCatalogService.getDataCatalogItem(catalogCode);
        return ResponseResult.success(selectItemVOList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询数据字典详情
     *
     * @param id
     * @return
     */
    @ApiOperation("查询数据字典详情")
    @GetMapping("/getDataCatalogDetail")
    public ResponseResult<DataCatalogVO> getDataCatalogDetail(String id) {
        DataCatalogVO detail = dataCatalogService.getDataCatalogDetail(id);
        return ResponseResult.success(detail, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存数据字典
     *
     * @param dto
     */
    @ApiOperation("保存数据字典")
    @PostMapping("/saveDataCatalog")
    public ResponseResult<DataCatalogVO> saveDataCatalog(@RequestBody DataCatalogDTO dto) {
        DataCatalogVO vo = dataCatalogService.saveDataCatalog(dto);
        return ResponseResult.success(vo, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 删除数据目录
     *
     * @param id
     */
    @ApiOperation("删除数据目录")
    @PostMapping("/deleteDataCatalog")
    public ResponseResult<?> deleteDataCatalog(String id) {
        dataCatalogService.deleteDataCatalog(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }

    /**
     * 删除数据字典条目
     *
     * @param id
     */
    @ApiOperation("删除数据字典条目")
    @PostMapping("/deleteDataCatalogItem")
    public ResponseResult<?> deleteDataCatalogItem(String id) {
        dataCatalogService.deleteDataCatalogItem(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}

