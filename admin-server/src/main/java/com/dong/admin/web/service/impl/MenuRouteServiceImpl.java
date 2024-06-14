package com.dong.admin.web.service.impl;

import com.dong.admin.constant.MenuConstant;
import com.dong.admin.web.dao.MenuRepository;
import com.dong.admin.web.dao.MenuRouteRepository;
import com.dong.admin.web.entity.Menu;
import com.dong.admin.web.entity.MenuRoute;
import com.dong.admin.web.model.dto.MenuDTO;
import com.dong.admin.web.model.dto.MenuRouteDTO;
import com.dong.admin.web.model.vo.MenuRouteVO;
import com.dong.admin.web.model.vo.RouteVO;
import com.dong.admin.web.service.MenuRouteService;
import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

@Service
public class MenuRouteServiceImpl implements MenuRouteService {

    @Autowired
    private MenuRouteRepository menuRouteRepository;

    @Autowired
    private CommonDao commonDao;


    /**
     * 查询菜单列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @Override
    public PageVO<MenuRouteVO> findMenuRouteList(MenuRouteDTO dto, Pagination pagination) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,title,`name`,path,`level`,sort,hidden FROM sys_menu_route ");
        sql.append(" WHERE 1 = 1 ");
        if (dto.getLevel() != null) {
            sql.append(" AND `level` = ? ");
            params.add(dto.getLevel());
        }
        if (dto.getHidden() != null) {
            sql.append(" AND hidden = ? ");
            params.add(dto.getHidden());
        }
        sql.append(" ORDER BY `level`,sort,hidden ASC ");
        return commonDao.findListBySql(pagination, sql, params, MenuRouteVO.class);
    }


    /**
     * 查询菜单树
     *
     * @param type （查询菜单树类型 1：根据递归获取菜单树(多次访问数据库)、2：根据所有菜单数据生成菜单树（访问一次数据库））
     * @return
     */
    @Override
    public List<Map<String, Object>> getMenuRouteTree(int type) {
        List<Map<String, Object>> result = new ArrayList<>();
        // if (1 == type) {
        //     // 根据递归获取菜单树(多次访问数据库)
        //     result = getMenuTreeByRecursion("");
        // } else if (2 == type) {
        //     // 根据所有菜单数据生成菜单树
        //     List<Menu> menuList = menuRepository.findAllByMenuStatusOrderByMenuSortAsc(CommonConstant.YES);
        //     result = getMenuTreeByALL(menuList);
        // }
        return result;
    }

    @Override
    public List<RouteVO> findRouteList() {
        List<MenuRoute> menuList = menuRouteRepository.findAll();
        return convertRouteVO(menuList);
    }

    private List<RouteVO> convertRouteVO(List<MenuRoute> menuList) {
        return null;
    }

    @Override
    public String saveMenuRoute(MenuRouteDTO dto) {
        Date now = new Date();
        Menu menu;
        MenuRoute route;
        // 新增
        if (StringUtils.isEmpty(dto.getId())) {
            menu = createMenu(dto, now);
            route = createRoute(dto, menu.getId(), now);
        } else {// 更新
            menu = updateMenu(dto, now);
            route = updateRoute(dto, menu.getId(), now);
        }
        return menuRouteRepository.save(route).getId();
    }

    private Menu createMenu(MenuRouteDTO dto, Date now) {
        Menu menu = new Menu();
        menu.setId(CommonUtils.getUUID());
        menu.setCreateTime(now);
        populateMenuFields(menu, dto);
        return menu;
    }

    private MenuRoute createRoute(MenuRouteDTO dto, String menuId, Date now) {
        MenuRoute route = new MenuRoute();
        route.setId(CommonUtils.getUUID());
        // route.setMenuId(menuId);
        route.setCreateTime(now);
        populateRouteFields(route, dto);
        route.setComponent("Layout");
        // route.setAlwaysShow(false);
        // route.setHidden(false);
        return route;
    }

    private Menu updateMenu(MenuRouteDTO dto, Date now) {
        // Menu menu = menuRepository.findById(dto.getId()).orElse(new Menu());
        // populateMenuFields(menu, dto);
        // menu.setUpdateTime(now);
        // return menu;
        return null;
    }

    private MenuRoute updateRoute(MenuRouteDTO dto, String menuId, Date now) {
        // MenuRoute route = menuRouteRepository.getByMenuId(menuId);
        // populateRouteFields(route, dto);
        // route.setUpdateTime(now);
        // return route;
        return null;
    }

    private void populateMenuFields(Menu menu, MenuRouteDTO dto) {
        menu.setParentId(dto.getParentId());
        // menu.setMenuName(dto.getMenuName());
        // menu.setMenuLevel(dto.getMenuLevel());
        // menu.setMenuIcon(dto.getMenuIcon());
        // menu.setMenuSort(dto.getMenuSort());
        // menu.setMenuUrl(dto.getRoutePath());
        // menu.setMenuPath(dto.getMenuPath());
        // menu.setMenuStatus(dto.getMenuStatus());
        // menu.setHasChild(dto.getHasChild());
    }

    private void populateRouteFields(MenuRoute route, MenuRouteDTO dto) {
        // route.setName(getRouteName(dto.getRoutePath()));
        route.setActiveMenu(dto.getActiveMenu());
        route.setRedirect(dto.getRedirect());
        route.setPermission(dto.getPermission());
        route.setRoles(dto.getRoles());
    }

    private String getRouteName(String menuUrl) {
        if (StringUtils.isBlank(menuUrl)) {
            return menuUrl; // 返回原字符串，或根据需求可能抛出异常
        }
        // 如果第一个字符是'/'，则去除它
        if (menuUrl.startsWith("/")) {
            menuUrl = menuUrl.substring(1);
        }
        // 如果去除'/'后字符串为空，则直接返回
        if (menuUrl.isEmpty()) {
            return menuUrl;
        }
        // 将第一个字符转换为大写，然后拼接回其余的部分
        return Character.toUpperCase(menuUrl.charAt(0)) + menuUrl.substring(1);
    }

    @Override
    public MenuRouteVO getMenuRoute(String id) {
        if (StringUtils.isBlank(id)) {
            throw new GlobalException("查询失败，id不能为空!");
        }
        MenuRoute menuRoute = menuRouteRepository.findById(id).orElse(new MenuRoute());
        return convertMenuRouteVO(menuRoute);
    }

    private MenuRouteVO convertMenuRouteVO(MenuRoute menuRoute) {
        MenuRouteVO vo = new MenuRouteVO();
        BeanUtils.copyProperties(menuRoute, vo);
        return vo;
    }

    @Override
    public void deleteMenuRoute(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("删除失败，id不能为空!");
        }
        List<MenuRoute> sysMenus = new ArrayList<>();
        MenuRoute entity = menuRouteRepository.findById(id).orElse(new MenuRoute());
        sysMenus.add(entity);
        // 判断是否有子菜单
        sysMenus.addAll(findChildrenMenuList(id));
        menuRouteRepository.deleteAll(sysMenus);

    }

    @Override
    public List<MenuRoute> findParentMenuRouteList() {
        return menuRouteRepository.findAllByLevelAndHidden(MenuConstant.FIRST_LEVEL_MENU, CommonConstant.YES);
    }

    /**
     * 查询所有子菜单
     *
     * @param id
     * @return
     */
    public List<MenuRoute> findChildrenMenuList(String id) {
        List<MenuRoute> result = new ArrayList<>();
        // // 判断是否有子菜单
        // List<Menu> childrenList = menuRepository.getAllByParentIdAndMenuStatus(id, CommonConstant.YES);
        // if (!CollectionUtils.isEmpty(childrenList)) {
        //     result.addAll(childrenList);
        //     for (Menu sysMenu : childrenList) {
        //         result.addAll(findChildrenMenuList(sysMenu.getId()));
        //     }
        //
        // }
        return result;
    }

    /**
     * 根据递归获取菜单树 (多次访问数据库)
     *
     * @param parentId //子菜单的父菜单主键
     * @return
     */
    private List<Map<String, Object>> getMenuTreeByRecursion(String parentId) {
        List<Map<String, Object>> menuMapList = new ArrayList<>();
        // List<Menu> menuList;
        // if (StringUtils.isEmpty(parentId)) {// 如果父菜单主键为空说明找的是一级菜单
        //     menuList = menuRepository.getAllByMenuLevelAndMenuStatus(MenuConstant.FIRST_LEVEL_MENU, CommonConstant.YES);
        // } else {
        //     menuList = menuRepository.getAllByParentIdAndMenuStatus(parentId, CommonConstant.YES);
        // }
        // if (!CollectionUtils.isEmpty(menuList)) {
        //     for (Menu sysMenu : menuList) {
        //         parentId = sysMenu.getId();
        //         List<Map<String, Object>> childrenList = new ArrayList<>();
        //         if (sysMenu.getHasChild() == 1) {
        //             // 递归获取子菜单
        //             childrenList = getMenuTreeByRecursion(parentId);
        //         }
        //         // 转换菜单对象
        //         Map<String, Object> map = convertMapMenu(sysMenu, childrenList);
        //         menuMapList.add(map);
        //     }
        // }
        return menuMapList;
    }

    /**
     * 根据所有菜单数据生成菜单树（访问一次菜单）
     *
     * @param menuList
     * @return
     */
    public List<Map<String, Object>> getMenuTreeByALL(List<Menu> menuList) {
        List<Map<String, Object>> result = new ArrayList<>();
        for (Menu menu : menuList) {
            if (menu.getMenuLevel() == 1) {
                // 转换菜单对象
                Map<String, Object> map = convertMapMenu(menu, null);
                if (menu.getHasChild() == 1) {
                    map.put("children", getChildrenMenuByRecursion(menuList, map));// 获取子菜单
                }
                result.add(map);
            }
        }
        return result;
    }

    /**
     * 递归获取子菜单
     *
     * @param menuList
     * @param parentMenu
     * @return
     */
    private List<Map<String, Object>> getChildrenMenuByRecursion(List<Menu> menuList, Map<String, Object> parentMenu) {
        List<Map<String, Object>> childrenList = new ArrayList<>();// 子菜单列表
        for (Menu menu : menuList) {
            if (StringUtils.isNotBlank(menu.getParentId()) && parentMenu.get("id").equals(menu.getParentId())) {
                Map<String, Object> childrenMenu = convertMapMenu(menu, null);
                // 递归获取子菜单
                childrenMenu.put("children", getChildrenMenuByRecursion(menuList, childrenMenu));
                childrenList.add(childrenMenu);
            }
        }
        return childrenList;
    }

    /**
     * 生成一个菜单对象
     *
     * @param menu
     * @param childrenList
     * @return
     */
    private Map<String, Object> convertMapMenu(Menu menu, List<Map<String, Object>> childrenList) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", menu.getId());
        map.put("title", menu.getMenuName());
        map.put("url", menu.getMenuUrl());
        map.put("icon", menu.getMenuIcon());
        map.put("order", menu.getMenuSort());
        map.put("children", childrenList);
        return map;
    }
}
