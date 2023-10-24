package com.dong.log.web.service;

import com.dong.commoncore.model.Pager;
import com.dong.log.web.entity.LoginLogs;
import com.dong.log.web.model.dto.LoginLogsDTO;
import com.dong.log.web.model.vo.LoginLogsVO;

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
