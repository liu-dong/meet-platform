package com.dong.log.web.service;

import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.log.web.entity.OperateLogs;
import com.dong.log.web.model.dto.OperateLogsDTO;
import com.dong.log.web.model.vo.OperateLogsVO;

public interface OperateLogsService {

    /**
     * 查询操作日志列表
     *
     * @param vo
     * @param pagination
     * @return
     */
    PageVO<OperateLogsVO> findOperateLogsList(OperateLogsVO vo, Pagination pagination);

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
