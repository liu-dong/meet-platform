package com.dong.warehouse.web.controller;

import com.dong.commoncore.model.Pagination;
import com.dong.warehouse.web.model.dto.InventoryDTO;
import com.dong.warehouse.web.model.vo.InventoryVO;
import com.dong.warehouse.web.service.InventoryService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
*  库存表
*
*  @author LD
*/
@RestController
@RequestMapping("/inventory")
public class InventoryController {

    @Autowired
    InventoryService inventoryService;

    /**
    * 查询库存表列表
    *
    * @param dto
    * @param pagination
    * @return
    */
    @GetMapping("/findInventoryList")
    public ResponseResult findInventoryList(InventoryDTO dto, Pagination pagination) {
        PageVO<InventoryVO> result = inventoryService.findInventoryList(dto, pagination);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 保存库存表
    *
    * @param dto
    * @return
    */
    @PostMapping("/saveInventory")
    public ResponseResult saveInventory(@RequestBody InventoryDTO dto) {
        InventoryVO result = inventoryService.saveInventory(dto);
        return ResponseResult.success(result, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
    * 查询库存表
    *
    * @param id
    * @return
    */
    @GetMapping("/getInventory")
    public ResponseResult getInventory(String id) {
        InventoryVO result = inventoryService.getInventory(id);
        return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
    * 删除库存表
    *
    * @param id
    * @return
    */
    @PostMapping("/deleteInventory")
    public ResponseResult deleteInventory(String id) {
        inventoryService.deleteInventory(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
