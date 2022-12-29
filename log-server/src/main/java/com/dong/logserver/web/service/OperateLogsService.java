package com.dong.logserver.web.service;

import com.dong.commoncore.model.Pager;
import com.dong.logserver.web.entity.OperateLogs;
import com.dong.logserver.web.model.dto.OperateLogsDTO;
import com.dong.logserver.web.model.vo.OperateLogsVO;

public interface OperateLogsService {

    /**
     * 查询操作日志列表
     *
     * @param vo
     * @param pager
     * @return
     */
    Pager<OperateLogsVO> findOperateLogsList(OperateLogsVO vo, Pager<OperateLogsVO> pager);

    /**
     * 保存操作日志
     *
     * @param dto
     * @return
     */
    OperateLogs saveOperateLogs(OperateLogsDTO dto);

    /**
     * 查询操作日志详情
     *
     * @param id
     * @return
     */
    OperateLogs getOperateLogs(String id);

    /**
     * 删除操作日志
     *
     * @param id
     * @return
     */
    void deleteOperateLogs(String id);

}
