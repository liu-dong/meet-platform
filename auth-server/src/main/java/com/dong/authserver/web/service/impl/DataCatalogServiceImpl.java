package com.dong.authserver.web.service.impl;

import com.dong.authserver.web.dao.DataCatalogItemJpaDao;
import com.dong.authserver.web.dao.DataCatalogJpaDao;
import com.dong.authserver.web.entity.DataCatalog;
import com.dong.authserver.web.entity.DataCatalogItem;
import com.dong.authserver.web.model.DataCatalogDTO;
import com.dong.authserver.web.service.DataCatalogService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public DataCatalog saveDataCatalog(DataCatalogDTO dto) throws ParseException {
        return null;
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
        sql.append(" FROM data_catalog ");
        sql.append(" WHERE 1=1 ");
        if (dto.getStatus() != null) {
            sql.append(" AND `status` = ? ");
            params.add(dto.getStatus());
        }
        if (dto.getCatalogName() != null) {
            sql.append(" AND `catalog_name` LIKE ? ");
            params.add("%" + dto.getCatalogName() + "%");
        }
        sql.append(" ORDER BY record_time DESC ");
        return commonDao.findListBySql(pager, sql, params, DataCatalogDTO.class);
    }

    @Override
    public Map<String, Object> findDataCatalogItem() {
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
        if (StringUtils.isEmpty(catalogCode)){
            throw new GlobalException(500, "目录编码为空");
        }
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT t2.item_code itemCode,t2.item_name itemName ");
        sql.append(" FROM data_catalog t1 ");
        sql.append(" INNER JOIN data_catalog_item t2 ON t2.catalog_id = t1.id ");
        sql.append(" WHERE t1.catalog_code = ? ");
        params.add(catalogCode);
        sql.append(" ORDER BY t2.sort ASC ");
        return commonDao.findListMapBySql(sql, params);
    }
}
