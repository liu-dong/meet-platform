package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.model.MenuInfoBean;
import com.dong.adminserver.web.service.MenuInfoService;
import com.dong.commoncore.annotation.Log;
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
@Api(tags = "菜单管理模块")
@RestController
@RequestMapping("/menuInfo")
public class MenuInfoController {

    @Autowired
    private MenuInfoService menuInfoService;

    /**
     * 查询菜单信息列表
     *
     * @return
     */
    @ApiOperation("查询菜单信息列表")
    @PostMapping("/findMenuInfoList")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult findMenuInfoList(@RequestBody MenuInfoBean bean, Integer limit, Integer page) {
        return menuInfoService.findMenuInfoList(bean, limit, page);
    }

    /**
     * 获取菜单树
     *
     * @return
     */
    @ApiOperation("获取菜单树")
    @GetMapping("/getMenuTree")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult getMenuTree(int type) {
        return menuInfoService.getMenuTree(type);
    }

    /**
     * 获取父级菜单
     *
     * @return
     */
    @ApiOperation("获取父级菜单")
    @PostMapping("/findParentMenuInfoList")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult findParentMenuInfoList() {
        return menuInfoService.findParentMenuInfoList();
    }

    /**
     * 保存菜单信息
     *
     * @param bean
     * @return
     */
    @ApiOperation("保存菜单信息")
    @PostMapping("/saveMenuInfo")
    public ResponseResult saveMenuInfo(@RequestBody MenuInfoBean bean) {
        return menuInfoService.saveMenuInfo(bean);
    }

    /**
     * 查询菜单详细信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询菜单详细信息")
    @GetMapping("/getMenuInfo")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult getMenuInfo(String id) {
        return menuInfoService.getMenuInfo(id);
    }

    /**
     * 删除菜单信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除菜单信息")
    @PostMapping("/deleteMenuInfo")
    public ResponseResult deleteMenuInfo(String id) {
        return menuInfoService.deleteMenuInfo(id);
    }
}
