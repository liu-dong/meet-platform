package com.dong.warehouse.web.service;

import com.dong.warehouse.web.model.dto.InventoryDTO;
import com.dong.warehouse.web.model.vo.InventoryVO;
import com.dong.commoncore.model.Pager;

public interface InventoryService {

    /**
    * 查询库存表列表
    *
    * @param dto
    * @param pager
    * @return
    */
    Pager<InventoryVO> findInventoryList(InventoryDTO dto, Pager<InventoryVO> pager);

    /**
    * 保存库存表
    *
    * @param dto
    * @return
    */
    InventoryVO saveInventory(InventoryDTO dto);

    /**
    * 查询库存表详情
    *
    * @param id
    * @return
    */
    InventoryVO getInventory(String id);

    /**
    * 删除库存表
    *
    * @param id
    * @return
    */
    void deleteInventory(String id);

}