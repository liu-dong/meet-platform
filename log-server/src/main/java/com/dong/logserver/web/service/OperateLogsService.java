package com.dong.logserver.web.service;

import com.dong.commoncore.model.ResponseResult;
import com.dong.logserver.web.model.OperateLogsBean;

public interface OperateLogsService {

    /**
     * 查询登录日志列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findOperateLogsList(OperateLogsBean bean, Integer limit, Integer page);

    /**
     * 保存登录日志
     *
     * @param bean
     * @return
     */
    ResponseResult saveOperateLogs(OperateLogsBean bean);

    /**
     * 查询登录日志详情
     *
     * @param id
     * @return
     */
    ResponseResult getOperateLogs(String id);

    /**
     * 删除登录日志
     *
     * @param id
     * @return
     */
    ResponseResult deleteOperateLogs(String id);
}
