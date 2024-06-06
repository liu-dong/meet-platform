package com.dong.admin.web.controller;

import com.dong.admin.web.entity.Menu;
import com.dong.admin.web.model.dto.MenuDTO;
import com.dong.admin.web.model.dto.MenuRouteDTO;
import com.dong.admin.web.model.vo.MenuRouteVO;
import com.dong.admin.web.model.vo.MenuVO;
import com.dong.admin.web.model.vo.RouteVO;
import com.dong.admin.web.service.MenuRouteService;
import com.dong.admin.web.service.MenuService;
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
    private MenuRouteService menuRouteService;

    /**
     * 查询菜单信息列表
     *
     * @return
     */
    @ApiOperation("查询菜单信息列表")
    @GetMapping("/findMenuList")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult<PageVO<MenuRouteVO>> findMenuList(MenuDTO dto, Pagination pagination) {
        PageVO<MenuRouteVO> menuList = menuRouteService.findMenuList(dto, pagination);
        return ResponseResult.success(menuList, ResponseMessageConstant.QUERY_SUCCESS);
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
        List<Map<String, Object>> menuTree = menuRouteService.getMenuTree(type);
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
    @GetMapping("/findParentMenuList")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult findParentMenuList() {
        List<Menu> parentMenuList = menuRouteService.findParentMenuList();
        return ResponseResult.success(parentMenuList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存菜单信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存菜单信息")
    @PostMapping("/saveMenu")
    public ResponseResult<String> saveMenu(@RequestBody MenuRouteDTO dto) {
        String id = menuRouteService.saveMenu(dto);
        return ResponseResult.success(id, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询菜单详细信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询菜单详细信息")
    @GetMapping("/getMenu")
    @Log(moduleCode = "admin-server", moduleName = "系统服务", operateType = "select")
    public ResponseResult getMenu(String id) {
        Menu menu = menuRouteService.getMenu(id);
        return ResponseResult.success(menu, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除菜单信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除菜单信息")
    @PostMapping("/deleteMenu")
    public ResponseResult deleteMenu(String id) {
        menuRouteService.deleteMenu(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
