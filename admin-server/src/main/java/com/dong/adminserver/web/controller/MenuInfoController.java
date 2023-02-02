package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.entity.Menu;
import com.dong.adminserver.web.model.dto.MenuDTO;
import com.dong.adminserver.web.model.vo.MenuVO;
import com.dong.adminserver.web.service.MenuInfoService;
import com.dong.commoncore.annotation.Log;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
    public ResponseResult findMenuInfoList(@RequestBody MenuDTO dto, Pager<MenuVO> pager) {
        Pager<MenuVO> menuInfoList = menuInfoService.findMenuInfoList(dto, pager);
        return ResponseResult.success(menuInfoList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 获取菜单树
     *
     * @return
     */
    @ApiOperation("获取菜单树")
    @GetMapping("/getMenuTree")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult getMenuTree(Integer type) {
        List<Map<String, Object>> menuTree = menuInfoService.getMenuTree(type);
        return ResponseResult.success(menuTree, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 获取父级菜单
     *
     * @return
     */
    @ApiOperation("获取父级菜单")
    @GetMapping("/findParentMenuInfoList")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult findParentMenuInfoList() {
        List<Menu> parentMenuInfoList = menuInfoService.findParentMenuInfoList();
        return ResponseResult.success(parentMenuInfoList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存菜单信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存菜单信息")
    @PostMapping("/saveMenuInfo")
    public ResponseResult saveMenuInfo(@RequestBody MenuDTO dto) {
        Menu menu = menuInfoService.saveMenuInfo(dto);
        return ResponseResult.success(menu, ResponseMessageConstant.SAVE_SUCCESS);
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
        Menu menu = menuInfoService.getMenuInfo(id);
        return ResponseResult.success(menu, ResponseMessageConstant.QUERY_SUCCESS);
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
        menuInfoService.deleteMenuInfo(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
