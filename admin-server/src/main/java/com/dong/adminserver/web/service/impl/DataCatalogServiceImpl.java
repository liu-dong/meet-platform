package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.DataCatalogItemJpaDao;
import com.dong.adminserver.web.dao.DataCatalogJpaDao;
import com.dong.adminserver.web.entity.DataCatalog;
import com.dong.adminserver.web.entity.DataCatalogItem;
import com.dong.adminserver.web.model.dto.DataCatalogDTO;
import com.dong.adminserver.web.model.vo.DataCatalogVO;
import com.dong.adminserver.web.service.DataCatalogService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

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
        BeanUtils.copyProperties(dto, entity);
        //保存数据字典目录
        DataCatalog dataCatalog = dataCatalogJpaDao.save(entity);
        //保存数据字典条目
        List<DataCatalogItem> itemList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(dto.getItemList())) {
            itemList = saveDataCatalogItem(dto.getItemList());
        }
        return convertDataCatalogVO(dataCatalog, itemList);
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
     * 保存数据字典条目
     *
     * @param itemList
     * @return
     */
    private List<DataCatalogItem> saveDataCatalogItem(List<DataCatalogItem> itemList) {
        for (DataCatalogItem item : itemList) {
            if (StringUtils.isNotBlank(item.getId())) {
                item.setUpdateTime(new Date());
            } else {
                item.setId(CommonUtils.getUUID());
                item.setCreateTime(new Date());
            }
        }
        return dataCatalogItemJpaDao.saveAll(itemList);
    }

    @Override
    public DataCatalog findDataCatalog(String id) throws Exception {
        return null;
    }

    @Override
    public void deleteDataCatalog(String id) throws Exception {

    }

    @Override
    public Pager<DataCatalogDTO> findDataCatalogList(DataCatalogDTO dto, Pager<DataCatalogDTO> pager) {
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
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, DataCatalogDTO.class);
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
    public List<Map<String, Object>> getDataCatalogItem(String catalogCode) {
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
}
