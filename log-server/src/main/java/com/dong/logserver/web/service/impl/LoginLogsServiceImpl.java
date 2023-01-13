package com.dong.logserver.web.service.impl;

import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import com.dong.logserver.web.dao.LoginLogsJpaDao;
import com.dong.logserver.web.entity.LoginLogs;
import com.dong.logserver.web.model.dto.LoginLogsDTO;
import com.dong.logserver.web.model.vo.LoginLogsVO;
import com.dong.logserver.web.service.LoginLogsService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author liudong 2022/1/28
 */
@Service
public class LoginLogsServiceImpl implements LoginLogsService {

    @Resource
    CommonDao commonDao;
    @Resource
    LoginLogsJpaDao loginLogsJpaDao;

    @Override
    public Pager<LoginLogsVO> findLoginLogsList(LoginLogsVO vo, Pager<LoginLogsVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id, account, login_type loginType, login_time loginTime, login_address loginAddress, ");
        sql.append(" login_ip loginIp, remark, create_time createTime ");
        sql.append(" FROM sys_login_logs ");
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, LoginLogsVO.class);
    }

    @Override
    public LoginLogs saveLoginLogs(LoginLogsDTO dto) {
        LoginLogs entity = new LoginLogs();
        BeanUtils.copyProperties(dto, entity);
        entity.setId(CommonUtils.getUUID());
        entity.setLoginTime(new Date());
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        entity = loginLogsJpaDao.save(entity);
        return entity;
    }

    @Override
    public LoginLogs getLoginLogs(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("id不能为空");
        }
        return loginLogsJpaDao.getById(id);
    }
}