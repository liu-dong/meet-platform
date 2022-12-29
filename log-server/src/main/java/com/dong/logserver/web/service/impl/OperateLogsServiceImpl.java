package com.dong.logserver.web.service.impl;

import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import com.dong.logserver.web.dao.OperateLogsJpaDao;
import com.dong.logserver.web.entity.OperateLogs;
import com.dong.logserver.web.model.dto.OperateLogsDTO;
import com.dong.logserver.web.model.vo.OperateLogsVO;
import com.dong.logserver.web.service.OperateLogsService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OperateLogsServiceImpl implements OperateLogsService {

    @Resource
    CommonDao commonDao;
    @Resource
    OperateLogsJpaDao operateLogsJpaDao;

    /**
     * 查询操作日志列表
     *
     * @param vo
     * @param pager
     * @return
     */
    @Override
    public Pager<OperateLogsVO> findOperateLogsList(OperateLogsVO vo, Pager<OperateLogsVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,account,operate_type operateType,operate_time operateTime,module_name moduleName, ");
        sql.append(" module_code moduleCode,operate_object operateObject,login_ip loginIp,content, ");
        sql.append(" create_time createTime,update_time updateTime ");
        sql.append(" FROM sys_operate_logs ");
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, OperateLogsVO.class);
    }

    /**
     * 保存操作日志
     *
     * @param dto
     * @return
     */
    @Override
    public OperateLogs saveOperateLogs(OperateLogsDTO dto) {
        OperateLogs entity = new OperateLogs();
        BeanUtils.copyProperties(dto, entity);
        entity.setId(CommonUtils.getUUID());
        entity.setOperateTime(new Date());
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        entity = operateLogsJpaDao.save(entity);
        return entity;
    }

    /**
     * 查询操作日志详情
     *
     * @param id
     * @return
     */
    @Override
    public OperateLogs getOperateLogs(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("id不能为空");
        }
        return operateLogsJpaDao.getById(id);
    }

    /**
     * 删除操作日志
     *
     * @param id
     * @return
     */
    @Override
    public void deleteOperateLogs(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("id不能为空");
        }
        operateLogsJpaDao.getById(id);
    }

}
