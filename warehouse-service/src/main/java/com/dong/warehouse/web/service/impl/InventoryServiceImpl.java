package com.dong.warehouse.web.service.impl;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CurrentUserUtils;
import com.dong.warehouse.web.dao.InventoryJpaDao;
import com.dong.warehouse.web.entity.Inventory;
import com.dong.warehouse.web.model.dto.InventoryDTO;
import com.dong.warehouse.web.model.vo.InventoryVO;
import com.dong.warehouse.web.service.InventoryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class InventoryServiceImpl implements InventoryService {

    @Autowired
    InventoryJpaDao inventoryJpaDao;
    @Autowired
    CommonDao commonDao;

    /**
     * 查询库存表列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<InventoryVO> findInventoryList(InventoryDTO dto, Pager<InventoryVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,product_name productName,product_code productCode,product_type product_type, ");
        sql.append(" amount,remaining_quantity remainingQuantity,cost_price costPrice,create_time createTime,update_time updateTime ");
        sql.append(" FROM inventory ");
        sql.append(" WHERE delete_status = 0 ");
        if (com.alibaba.excel.util.StringUtils.isNotBlank(dto.getProductName())) {
            sql.append(" AND product_name LIKE ? ");
            params.add("%" + dto.getProductName().trim() + "%");
        }
        sql.append(" ORDER BY update_time DESC ");
        return commonDao.findListBySql(pager, sql, params, InventoryVO.class);
    }

    /**
     * 保存库存表
     *
     * @param dto
     * @return
     */
    @Override
    public InventoryVO saveInventory(InventoryDTO dto) {
        InventoryVO vo = new InventoryVO();
        Inventory inventory = convertEntity(dto);
        inventoryJpaDao.save(inventory);
        BeanUtils.copyProperties(inventory, vo);
        return vo;
    }

    private Inventory convertEntity(InventoryDTO dto) {
        Inventory entity = new Inventory();
        if (StringUtils.isBlank(dto.getId())) {
            entity.setId(UUID.randomUUID().toString());
            entity.setProductCode("00000");
            entity.setDeleteStatus(CommonConstant.NO);
            entity.setCreateTime(new Date());
            if (CurrentUserUtils.currentUser() !=null) {
                entity.setCreateUserId(CurrentUserUtils.getUsername());
            }
        } else {
            entity = inventoryJpaDao.findById(dto.getId()).orElse(new Inventory());
        }

        entity.setProductType(dto.getProductType());
        entity.setProductName(dto.getProductName());
        entity.setProductDescription(dto.getProductDescription());

        entity.setImageUrl(dto.getImageUrl());
        entity.setAmount(dto.getAmount());
        entity.setRemainingQuantity(dto.getRemainingQuantity());
        entity.setCostPrice(dto.getCostPrice());
        entity.setRemark(dto.getRemark());
        entity.setUpdateTime(new Date());
        if (CurrentUserUtils.currentUser() !=null) {
            entity.setUpdateUserId(CurrentUserUtils.getUsername());
        }
        return entity;
    }

    /**
     * 查询库存表详情
     *
     * @param id
     * @return
     */
    @Override
    public InventoryVO getInventory(String id) {
        if (StringUtils.isBlank(id)) {
            throw new GlobalException("查询失败，id不能为空!");
        }
        Inventory inventory = inventoryJpaDao.findById(id).orElse(new Inventory());
        InventoryVO vo = new InventoryVO();
        BeanUtils.copyProperties(inventory, vo);
        return vo;
    }

    /**
     * 删除库存表
     *
     * @param id
     * @return
     */
    @Override
    public void deleteInventory(String id) {
        if (StringUtils.isBlank(id)) {
            throw new GlobalException("删除失败，id不能为空!");
        }
        Inventory inventory = inventoryJpaDao.findById(id).orElse(new Inventory());
        inventory.setDeleteStatus(CommonConstant.YES);
        inventoryJpaDao.save(inventory);
    }

}
