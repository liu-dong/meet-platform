package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.model.PermissionInfoBean;
import com.dong.adminserver.web.service.PermissionInfoService;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 菜单管理模块
 *
 * @author LD
 */
@Api(tags = "权限管理模块")
@RestController
@RequestMapping("/permissionInfo")
public class PermissionInfoController {

    @Autowired
    private PermissionInfoService permissionInfoService;

    /**
     * 查询权限信息列表
     *
     * @return
     */
    @ApiOperation("查询权限信息列表")
    @PostMapping("/findPermissionInfoList")
    public ResponseResult findPermissionInfoList(PermissionInfoBean bean, Integer limit, Integer page) {
        return permissionInfoService.findPermissionInfoList(bean, limit, page);
    }

    /**
     * 查询权限树
     *
     * @return
     */
    @ApiOperation("查询权限树")
    @GetMapping("/getPermissionTree")
    public ResponseResult getPermissionTree(PermissionInfoBean bean) {
        return permissionInfoService.getPermissionTree(bean);
    }

    /**
     * 保存权限信息
     *
     * @param bean
     * @return
     */
    @ApiOperation("保存权限信息")
    @PostMapping("/savePermissionInfo")
    public ResponseResult savePermissionInfo(@RequestBody PermissionInfoBean bean) {
        return permissionInfoService.savePermissionInfo(bean);
    }

    /**
     * 查询权限详细信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询权限详细信息")
    @GetMapping("/getPermissionInfo")
    public ResponseResult getPermissionInfo(String id) {
        return permissionInfoService.getPermissionInfo(id);
    }

    /**
     * 删除权限信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除权限信息")
    @PostMapping("/deletePermissionInfo")
    public ResponseResult deletePermissionInfo(String id) {
        return permissionInfoService.deletePermissionInfo(id);
    }
}
