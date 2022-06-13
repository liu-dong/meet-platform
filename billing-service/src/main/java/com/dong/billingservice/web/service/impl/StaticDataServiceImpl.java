package com.dong.billingservice.web.service.impl;

import com.dong.billingservice.web.dao.CommonDao;
import com.dong.billingservice.web.model.StaticSpecDTO;
import com.dong.billingservice.web.model.StaticValueDTO;
import com.dong.billingservice.web.service.StaticDataService;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 数据字典规格表(StaticSpec)服务实现类
 *
 * @author zjx
 * @since 2022-06-11
 */
@Service
public class StaticDataServiceImpl implements StaticDataService {

    @Autowired
    private CommonDao commonDao;

    @Override
    public StaticSpecDTO findStaticSpec(String code) throws Exception {
        StringBuilder specSql = new StringBuilder();
        List<Object> specParams = new ArrayList<>();
        specSql.append(" SELECT id,spec_code specCode,spec_name specName ");
        specSql.append(" FROM static_spec ");
        specSql.append(" WHERE spec_code = ? ");
        specParams.add(code);
        List<StaticSpecDTO> staticSpecDTOs = commonDao.findListBySql(specSql, specParams, StaticSpecDTO.class);
        if (CollectionUtils.isEmpty(staticSpecDTOs)) {
            return null;
        }
        StaticSpecDTO staticSpecDTO = staticSpecDTOs.get(0);
        StringBuilder valueSql = new StringBuilder();
        List<Object> valueParams = new ArrayList<>();
        valueSql.append(" SELECT id,spec_id specId,value_name valueName,value_value valueValue ");
        valueSql.append(" FROM static_value ");
        valueSql.append(" WHERE spec_id = ? ");
        valueParams.add(staticSpecDTO.getId());
        List<StaticValueDTO> staticValues = commonDao.findListBySql(valueSql, valueParams, StaticValueDTO.class);
        staticSpecDTO.setValues(staticValues);
        return staticSpecDTO;
    }
}
