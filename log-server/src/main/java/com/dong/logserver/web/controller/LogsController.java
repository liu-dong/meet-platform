package com.dong.logserver.web.controller;

import com.dong.commoncore.contant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.logserver.web.entity.LoginLogs;
import com.dong.logserver.web.model.LoginLogsVO;
import com.dong.logserver.web.model.OperateLogsBean;
import com.dong.logserver.web.model.dto.LoginLogsDTO;
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
    @PostMapping("/findLoginLogsList")
    public ResponseResult findLoginLogsList(@RequestBody LoginLogsVO vo, Pager<LoginLogsVO> pager) {
        Pager<LoginLogsVO> loginLogsList = loginLogsService.findLoginLogsList(vo, pager);
        return ResponseResult.success(loginLogsList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    @ApiOperation("保存登录日志")
    @PostMapping("/saveLoginLogs")
    public ResponseResult saveLoginLogs(@RequestBody LoginLogsDTO dto) {
        LoginLogs loginLogs = loginLogsService.saveLoginLogs(dto);
        return ResponseResult.success(loginLogs, ResponseMessageConstant.SAVE_SUCCESS);

    }

    @ApiOperation("查询登录日志详情")
    @GetMapping("/getLoginLogs")
    public ResponseResult getLoginLogs(String id) {
        LoginLogs loginLogs = loginLogsService.getLoginLogs(id);
        return ResponseResult.success(loginLogs, ResponseMessageConstant.SAVE_SUCCESS);

    }

    /**
     * 查询操作日志列表
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
