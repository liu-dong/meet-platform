package com.dong.logserver.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.logserver.web.model.LoginLogsBean;
import com.dong.logserver.web.model.OperateLogsBean;
import com.dong.logserver.web.service.LoginLogsService;
import com.dong.logserver.web.service.OperateLogsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 日志
 *
 * @author liudong 2022/1/30
 */
@Api(tags = "日志信息管理模块")
@RestController
@RequestMapping("/logs")
public class LogsController {

    @Autowired
    LoginLogsService loginLogsService;
    @Autowired
    OperateLogsService operateLogsService;


    @ApiOperation("查询登录日志信息列表")
    @GetMapping("/findLoginLogsList")
    public ResponseResult findLoginLogsList(@RequestBody LoginLogsBean bean, Integer limit, Integer page) {
        return loginLogsService.findLoginLogsList(bean, limit, page);
    }

    @ApiOperation("保存登录日志")
    @PostMapping("/saveLoginLogs")
    public ResponseResult saveLoginLogs(@RequestBody LoginLogsBean bean) {
        return loginLogsService.saveLoginLogs(bean);

    }

    /**
     * 查询登录日志列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @ApiOperation("查询操作日志列表")
    @PostMapping("/findOperateLogsList")
    public ResponseResult findOperateLogsList(OperateLogsBean bean, Integer limit, Integer page) {
        return operateLogsService.findOperateLogsList(bean, limit, page);
    }

    /**
     * 保存操作日志
     *
     * @param bean
     * @return
     */
    @ApiOperation("保存操作日志")
    @PostMapping("/saveOperateLogs")
    public ResponseResult saveOperateLogs(OperateLogsBean bean) {
        return operateLogsService.saveOperateLogs(bean);
    }

    /**
     * 查询操作日志
     *
     * @param id
     * @return
     */
    @ApiOperation("查询操作日志")
    @GetMapping("/getOperateLogs")
    public ResponseResult getOperateLogs(String id) {
        return operateLogsService.getOperateLogs(id);
    }

    /**
     * 删除操作日志
     *
     * @param id
     * @return
     */
    @ApiOperation("删除操作日志")
    @PostMapping("/deleteOperateLogs")
    public ResponseResult deleteOperateLogs(String id) {
        return operateLogsService.deleteOperateLogs(id);
    }
}
