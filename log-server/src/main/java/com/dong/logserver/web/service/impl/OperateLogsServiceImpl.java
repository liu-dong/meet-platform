package com.dong.logserver.web.service.impl;

import com.dong.commoncore.model.ResponseResult;
import com.dong.logserver.web.model.OperateLogsBean;
import com.dong.logserver.web.service.OperateLogsService;
import org.springframework.stereotype.Service;

@Service
public class OperateLogsServiceImpl implements OperateLogsService {

   /**
    * 查询登录日志列表
    *
    * @param bean
    * @param limit
    * @param page
    * @return
    */
   @Override
   public ResponseResult findOperateLogsList(OperateLogsBean bean, Integer limit, Integer page) {
      return null;
   }

   /**
    * 保存登录日志
    *
    * @param bean
    * @return
    */
   @Override
   public ResponseResult saveOperateLogs(OperateLogsBean bean) {
      return null;
   }

   /**
    * 查询登录日志详情
    *
    * @param id
    * @return
    */
   @Override
   public ResponseResult getOperateLogs(String id) {
      return null;
   }

   /**
    * 删除登录日志
    *
    * @param id
    * @return
    */
   @Override
   public ResponseResult deleteOperateLogs(String id) {
      return null;
   }

}
