package com.dong.generator.web.service.impl;

import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.model.ResponseResult;
import com.dong.generator.web.model.DatabasesInfoBean;
import com.dong.generator.web.service.DatabaseService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author LD
 */
@Service
public class DatabaseServiceImpl implements DatabaseService {

    @Autowired
    private CommonDao commonDao;

    @Override
    public ResponseResult findDatabasesInfoList(DatabasesInfoBean bean) {
        ResponseResult result = new ResponseResult();
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SHOW DATABASES ");
        List<Map<String, Object>> dataList = commonDao.findListBySql(sql, param);
        result.setData(dataList);
        result.setMessage("查询成功！");
        return result;
    }

    /**
     * 查询数据表列表
     *
     * @param bean
     * @return
     */
    @Override
    public ResponseResult findTableInfoList(DatabasesInfoBean bean) {
        ResponseResult result = new ResponseResult();
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SHOW TABLE STATUS FROM ");
        if (StringUtils.isNotBlank(bean.getDatabasesName())) {
            sql.append(bean.getDatabasesName());
        } else {
            sql.append(" my_data ");//默认此数据库
        }
        sql.append(" WHERE 1=1 ");
        if (StringUtils.isNotBlank(bean.getTableName())) {
            sql.append(" AND `Name` LIKE ? ");
            param.add("%" + bean.getTableName().trim() + "%");
        }
        List<Map<String, Object>> dataList = commonDao.findListBySql(sql, param);
        result.setData(dataList);
        result.setMessage("查询成功！");
        return result;
    }

}
