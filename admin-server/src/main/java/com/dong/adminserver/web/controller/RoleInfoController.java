package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.model.RoleInfoBean;
import com.dong.adminserver.web.service.RoleInfoService;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 角色信息管理
 *
 * @author LD
 */
@Api(tags = "角色信息管理模块")
@RestController
@RequestMapping("/roleInfo")
public class RoleInfoController {

    @Autowired
    private RoleInfoService roleInfoService;

    /**
     * 查询角色信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @ApiOperation("查询角色信息列表")
    @PostMapping("/findRoleInfoList")
    public ResponseResult findRoleInfoList(@RequestBody RoleInfoBean bean, Integer limit, Integer page) {
        return roleInfoService.findRoleInfoList(bean, limit, page);
    }

    /**
     * 保存角色信息
     *
     * @param bean
     * @return
     */
    @ApiOperation("保存角色信息")
    @PostMapping("/saveRoleInfo")
    public ResponseResult saveRoleInfo(@RequestBody RoleInfoBean bean) {
        return roleInfoService.saveRoleInfo(bean);
    }

    /**
     * 查询角色信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询角色信息")
    @GetMapping("/getRoleInfo")
    public ResponseResult getRoleInfo(String id) {
        return roleInfoService.getRoleInfo(id);
    }

    /**
     * 删除角色信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除角色信息")
    @PostMapping("/deleteRoleInfo")
    public ResponseResult deleteRoleInfo(String id) {
        return roleInfoService.deleteRoleInfo(id);
    }

    /**
     * 查询角色账号信息
     *
     * @param bean
     * @return
     */
    @ApiOperation("查询角色账号信息")
    @PostMapping("/findRoleAccountInfoList")
    public ResponseResult findRoleAccountInfoList(@RequestBody RoleInfoBean bean) {
        return roleInfoService.findRoleAccountInfoList(bean);
    }

    /**
     * 查询角色权限信息
     *
     * @param bean
     * @return
     */
    @ApiOperation("查询角色权限信息")
    @PostMapping("/findRolePermissionInfoList")
    public ResponseResult findRolePermissionInfoList(@RequestBody RoleInfoBean bean) {
        return roleInfoService.findRolePermissionInfoList(bean);
    }

    /**
     * 分派账号
     *
     * @param bean
     * @return
     */
    @ApiOperation("分派账号")
    @PostMapping("/assignAccounts")
    public ResponseResult assignAccounts(@RequestBody RoleInfoBean bean) {
        return roleInfoService.assignAccounts(bean);
    }

    /**
     * 分派权限
     *
     * @param bean
     * @return
     */
    @ApiOperation("分派权限")
    @PostMapping("/assignPermissions")
    public ResponseResult assignPermissions(@RequestBody RoleInfoBean bean) {
        return roleInfoService.assignPermissions(bean);
    }


}