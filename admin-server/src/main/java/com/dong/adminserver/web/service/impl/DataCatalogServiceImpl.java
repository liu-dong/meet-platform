package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.DataCatalogItemJpaDao;
import com.dong.adminserver.web.dao.DataCatalogJpaDao;
import com.dong.adminserver.web.entity.DataCatalog;
import com.dong.adminserver.web.entity.DataCatalogItem;
import com.dong.adminserver.web.model.dto.DataCatalogDTO;
import com.dong.adminserver.web.model.dto.DataCatalogItemDTO;
import com.dong.adminserver.web.model.vo.DataCatalogVO;
import com.dong.adminserver.web.model.vo.SelectItemVO;
import com.dong.adminserver.web.service.DataCatalogService;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author liudong 2022/8/3
 */
@Service
public class DataCatalogServiceImpl implements DataCatalogService {

    @Autowired
    CommonDao commonDao;
    @Autowired
    DataCatalogJpaDao dataCatalogJpaDao;
    @Autowired
    DataCatalogItemJpaDao dataCatalogItemJpaDao;

    /**
     * 保存数据目录
     *
     * @param dto
     * @return
     */
    @Transactional
    @Override
    public DataCatalogVO saveDataCatalog(DataCatalogDTO dto) {
        DataCatalog entity = new DataCatalog();
        if (StringUtils.isNotBlank(dto.getId())) {
            entity = dataCatalogJpaDao.findById(dto.getId()).orElse(new DataCatalog());
            entity.setUpdateTime(new Date());
        } else {
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        }
        convertEntity(dto, entity);
        //保存数据字典目录
        DataCatalog dataCatalog = dataCatalogJpaDao.save(entity);
        //保存数据字典条目
        List<DataCatalogItem> itemList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(dto.getItemList())) {
            itemList = saveDataCatalogItemList(dto.getItemList(), entity.getId());
        }
        return convertDataCatalogVO(dataCatalog, itemList);
    }

    /**
     * 转换实体类
     *
     * @param dto
     * @param entity
     */
    private void convertEntity(DataCatalogDTO dto, DataCatalog entity) {
        entity.setCatalogCode(dto.getCatalogCode());
        entity.setCatalogName(dto.getCatalogName());
        entity.setDescription(dto.getDescription());
        entity.setRemark(dto.getRemark());
        entity.setStatus(CommonConstant.YES);//默认是
    }

    /**
     * 转换实体类
     *
     * @param dto
     * @param entity
     */
    private void convertEntity(DataCatalogItemDTO dto, DataCatalogItem entity) {
        entity.setItemCode(dto.getItemCode());
        entity.setItemName(dto.getItemName());
        entity.setSort(dto.getSort());
        entity.setRemark(dto.getRemark());
        entity.setStatus(CommonConstant.YES);//默认是
    }

    /**
     * 转换数据对象
     *
     * @param dataCatalog
     * @param itemList
     * @return
     */
    private DataCatalogVO convertDataCatalogVO(DataCatalog dataCatalog, List<DataCatalogItem> itemList) {
        DataCatalogVO result = new DataCatalogVO();
        BeanUtils.copyProperties(dataCatalog, result);
        result.setItemList(itemList);
        return result;
    }


    /**
     * 保存数据字典条目集合
     *
     * @param itemList
     * @return
     */
    private List<DataCatalogItem> saveDataCatalogItemList(List<DataCatalogItemDTO> itemList, String catalogId) {
        List<DataCatalogItem> entityList = new ArrayList<>();
        for (DataCatalogItemDTO dto : itemList) {
            //判断是否删除
            if (dto.getIsDelete() == CommonConstant.YES) {
                deleteDataCatalogItem(dto.getId());
            } else {
                DataCatalogItem entity = buildDataCatalogItem(catalogId, dto);
                entityList.add(entity);
            }
        }
        return dataCatalogItemJpaDao.saveAll(entityList);
    }

    /**
     * 构建数据字典条目实体对象
     *
     * @param catalogId
     * @param dto
     * @return
     */
    private DataCatalogItem buildDataCatalogItem(String catalogId, DataCatalogItemDTO dto) {
        DataCatalogItem entity = new DataCatalogItem();
        if (StringUtils.isNotBlank(dto.getId())) {
            entity = dataCatalogItemJpaDao.findById(dto.getId()).orElse(new DataCatalogItem());
            entity.setUpdateTime(new Date());
        } else {
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        }
        //转换实体类
        convertEntity(dto, entity);
        entity.setCatalogId(catalogId);
        return entity;
    }

    @Override
    public DataCatalogVO getDataCatalogDetail(String id) {
        DataCatalog dataCatalog = dataCatalogJpaDao.findById(id).orElse(new DataCatalog());
        List<DataCatalogItem> catalogItemList = dataCatalogItemJpaDao.findByCatalogIdAndStatus(id, CommonConstant.YES);
        return convertDataCatalogVO(dataCatalog, catalogItemList);
    }

    @Override
    public void deleteDataCatalog(String id) {
        if (dataCatalogJpaDao.existsById(id)) {
            //删除数据字典条目
            dataCatalogItemJpaDao.deleteByCatalogId(id);
            //删除数据字典目录
            dataCatalogJpaDao.deleteById(id);
        }
    }

    @Override
    public void deleteDataCatalogItem(String id) {
        if (dataCatalogItemJpaDao.existsById(id)) {
            dataCatalogItemJpaDao.deleteById(id);
        }
    }

    @Override
    public Pager<DataCatalogVO> findDataCatalogList(DataCatalogDTO dto, Pager<DataCatalogVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,catalog_code catalogCode,catalog_name catalogName,description,`status`,create_time createTime ");
        sql.append(" FROM sys_data_catalog ");
        sql.append(" WHERE 1=1 ");
        if (dto.getStatus() != null) {
            sql.append(" AND `status` = ? ");
            params.add(dto.getStatus());
        }
        if (dto.getCatalogName() != null) {
            sql.append(" AND `catalog_name` LIKE ? ");
            params.add("%" + dto.getCatalogName() + "%");
        }
        if (dto.getCatalogCode() != null) {
            sql.append(" AND `catalog_code` LIKE ? ");
            params.add("%" + dto.getCatalogCode() + "%");
        }
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, DataCatalogVO.class);
    }

    @Override
    public Map<String, Object> findDataCatalogItemList() {
        Map<String, Object> result = new HashMap<>();
        List<DataCatalog> dataCatalogs = dataCatalogJpaDao.findAll();
        for (DataCatalog dataCatalog : dataCatalogs) {
            List<DataCatalogItem> itemList = dataCatalogItemJpaDao.findByCatalogId(dataCatalog.getId());
            result.put(dataCatalog.getCatalogCode(), itemList);
        }
        return result;
    }

    @Override
    public List<Map<String, Object>> getDataCatalogItemList(String catalogCode) {
        if (StringUtils.isEmpty(catalogCode)) {
            throw new GlobalException(500, "目录编码为空");
        }
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT t2.item_code itemCode,t2.item_name itemName ");
        sql.append(" FROM sys_data_catalog t1 ");
        sql.append(" INNER JOIN sys_data_catalog_item t2 ON t2.catalog_id = t1.id ");
        sql.append(" WHERE t1.catalog_code = ? ");
        params.add(catalogCode);
        sql.append(" ORDER BY t2.sort ASC ");
        return commonDao.findListMapBySql(sql, params);
    }

    @Override
    public List<SelectItemVO> getDataCatalogItem(String catalogCode) {
        List<Map<String, Object>> dataCatalogItemList = this.getDataCatalogItemList(catalogCode);
        return convertSelectItemVO(dataCatalogItemList);
    }

    private List<SelectItemVO> convertSelectItemVO(List<Map<String, Object>> dataCatalogItemList) {
        return dataCatalogItemList.stream().map(map -> new SelectItemVO(map.get("itemName").toString(), map.get("itemCode").toString())).collect(Collectors.toList());
    }
}
