package com.dong.admin.web.controller;

import com.dong.admin.web.entity.MenuRoute;
import com.dong.admin.web.model.dto.MenuRouteDTO;
import com.dong.admin.web.model.vo.MenuRouteVO;
import com.dong.admin.web.model.vo.RouteVO;
import com.dong.admin.web.service.MenuRouteService;
import com.dong.commoncore.annotation.Log;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 菜单路由管理(vue定制菜单路由管理功能)
 *
 * @author LD
 */
@Api(tags = "菜单管理模块")
@RestController
@RequestMapping("/menuRoute")
public class MenuRouteController {

    @Autowired
    MenuRouteService menuRouteService;

    /**
     * 查询菜单信息列表
     *
     * @return
     */
    @ApiOperation("查询菜单信息列表")
    @GetMapping("/findMenuRouteList")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult<PageVO<MenuRouteVO>> findMenuRouteList(MenuRouteDTO dto, Pagination pagination) {
        PageVO<MenuRouteVO> menuList = menuRouteService.findMenuRouteList(dto, pagination);
        return ResponseResult.success(menuList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 获取菜单树
     *
     * @return
     */
    @ApiOperation("获取菜单树")
    @GetMapping("/getMenuRouteTree")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult getMenuRouteTree(Integer type) {
        List<Map<String, Object>> menuTree = menuRouteService.getMenuRouteTree(type);
        return ResponseResult.success(menuTree, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 获取菜单路由列表
     *
     * @return
     */
    @GetMapping("/findRouteList")
    public ResponseResult findRouteList() {
        List<RouteVO> routeList = menuRouteService.findRouteList();
        return ResponseResult.success(routeList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 获取父级菜单
     *
     * @return
     */
    @ApiOperation("获取父级菜单")
    @GetMapping("/findParentMenuRouteList")
    public ResponseResult<List<MenuRoute>> findParentMenuRouteList() {
        List<MenuRoute> parentMenuRouteList = menuRouteService.findParentMenuRouteList();
        return ResponseResult.success(parentMenuRouteList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存菜单信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存菜单信息")
    @PostMapping("/saveMenuRoute")
    public ResponseResult<String> saveMenuRoute(@RequestBody MenuRouteDTO dto) {
        String id = menuRouteService.saveMenuRoute(dto);
        return ResponseResult.success(id, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询菜单详细信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询菜单详细信息")
    @GetMapping("/getMenuRoute")
    public ResponseResult<MenuRouteVO> getMenuRoute(String id) {
        MenuRouteVO menu = menuRouteService.getMenuRoute(id);
        return ResponseResult.success(menu, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除菜单信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除菜单信息")
    @PostMapping("/deleteMenuRoute")
    public ResponseResult<?> deleteMenuRoute(String id) {
        menuRouteService.deleteMenuRoute(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
