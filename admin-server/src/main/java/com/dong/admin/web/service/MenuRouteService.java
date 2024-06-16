package com.dong.admin.web.service;

import com.dong.admin.web.entity.MenuRoute;
import com.dong.admin.web.model.dto.MenuRouteDTO;
import com.dong.admin.web.model.vo.MenuRouteTreeVO;
import com.dong.admin.web.model.vo.MenuRouteVO;
import com.dong.admin.web.model.vo.RouteVO;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;

import java.util.List;
import java.util.Map;

public interface MenuRouteService {


    /**
     * 查询菜单列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    PageVO<MenuRouteVO> findMenuRouteList(MenuRouteDTO dto, Pagination pagination);

    /**
     * 查询菜单树列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    PageVO<MenuRouteTreeVO> findMenuRouteTreeList(MenuRouteDTO dto, Pagination pagination);

    /**
     * 查询菜单树
     *
     * @param type （查询菜单树类型 1：根据递归获取菜单树(多次访问数据库)、2：根据所有菜单数据生成菜单树（访问一次菜单））
     * @return
     */
    List<Map<String, Object>> getMenuRouteTree(int type);

    /**
     * 获取菜单路由列表
     *
     * @return
     */
    List<RouteVO> findRouteList();

    /**
     * 保存菜单信息
     *
     * @param dto
     * @return
     */
    String saveMenuRoute(MenuRouteDTO dto);

    /**
     * 查询菜单详细页面
     *
     * @param id
     * @return
     */
    MenuRouteVO getMenuRoute(String id);

    /**
     * 删除菜单信息
     *
     * @param id
     */
    void deleteMenuRoute(String id);

    /**
     * 获取父级菜单
     *
     * @return
     */
    List<MenuRoute> findParentMenuRouteList();
}
