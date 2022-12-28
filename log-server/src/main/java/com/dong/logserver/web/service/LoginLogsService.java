package com.dong.logserver.web.service;

import com.dong.commoncore.model.ResponseResult;
import com.dong.logserver.web.model.LoginLogsBean;

public interface LoginLogsService {

    /**
     * 查询登录日志信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findLoginLogsList(LoginLogsBean bean, Integer limit, Integer page);

    /**
     * 保存登录日志信息
     *
     * @param bean
     * @return
     */
    ResponseResult saveLoginLogs(LoginLogsBean bean);

    /**
     * 查询登录日志详请
     *
     * @param id
     * @return
     */
    ResponseResult getLoginLogsInfo(String id);


}
