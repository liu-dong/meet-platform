package com.dong.logserver.web.service;

import com.dong.commoncore.model.Pager;
import com.dong.logserver.web.entity.LoginLogs;
import com.dong.logserver.web.model.LoginLogsVO;
import com.dong.logserver.web.model.dto.LoginLogsDTO;

public interface LoginLogsService {

    /**
     * 查询登录日志信息列表
     *
     * @param vo
     * @param pager
     * @return
     */
    Pager<LoginLogsVO> findLoginLogsList(LoginLogsVO vo, Pager<LoginLogsVO> pager);

    /**
     * 保存登录日志信息
     *
     * @param dto
     * @return
     */
    LoginLogs saveLoginLogs(LoginLogsDTO dto);

    /**
     * 查询登录日志详请
     *
     * @param id
     * @return
     */
    LoginLogs getLoginLogs(String id);


}
