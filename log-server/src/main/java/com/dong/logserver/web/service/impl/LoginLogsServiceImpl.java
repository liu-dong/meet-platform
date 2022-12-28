package com.dong.logserver.web.service.impl;

import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import com.dong.logserver.web.dao.LoginLogsJpaDao;
import com.dong.logserver.web.entity.LoginLogs;
import com.dong.logserver.web.model.LoginLogsBean;
import com.dong.logserver.web.service.LoginLogsService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * @author liudong 2022/1/28
 */
@Service
public class LoginLogsServiceImpl implements LoginLogsService {

    @Autowired
    LoginLogsJpaDao loginLogsJpaDao;

    @Override
    public ResponseResult findLoginLogsList(LoginLogsBean bean, Integer limit, Integer page) {
        List<LoginLogs> loginLogsList = loginLogsJpaDao.findAll();
        return ResponseResult.success(null, "查询成功!");
    }

    @Override
    public ResponseResult saveLoginLogs(LoginLogsBean bean) {
        LoginLogs entity = new LoginLogs();
        BeanUtils.copyProperties(bean, entity);
        entity.setId(CommonUtils.getUUID());
        entity.setAccount(bean.getAccount());
        entity.setLoginTime(new Date());
        entity.setCreateTime(new Date());
        entity = loginLogsJpaDao.save(entity);
        return ResponseResult.success(entity, "保存成功!");
    }

    @Override
    public ResponseResult getLoginLogsInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            LoginLogs entity = loginLogsJpaDao.getOne(id);
            return ResponseResult.success(null, "查询成功!");
        }
        return ResponseResult.error("查询失败，id不能为空!");
    }
}
