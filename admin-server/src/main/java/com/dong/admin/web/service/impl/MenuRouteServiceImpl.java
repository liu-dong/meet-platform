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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

@Service
public class MenuRouteServiceImpl implements MenuRouteService {

    @Autowired
    private MenuRepository menuRepository;
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
    public PageVO<MenuRouteVO> findMenuList(MenuDTO dto, Pagination pagination) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT t1.id,t1.menu_name menuName,t1.menu_level menuLevel,t1.menu_icon menuIcon,t1.menu_sort, ");
        sql.append(" t1.menu_url routePath,t1.menu_path menuPath,t1.menu_status menuStatus,t2.`name` routeName ");
        sql.append(" FROM sys_menu t1 ");
        sql.append(" INNER JOIN sys_menu_route t2 ON t2.menu_id=t1.id ");
        sql.append(" WHERE 1 = 1 ");
        if (dto.getMenuStatus() != null) {
            sql.append(" AND t1.menu_status = ? ");
            params.add(dto.getMenuStatus());
        }
        if (dto.getMenuLevel() != null) {
            sql.append(" AND t1.menu_level = ? ");
            params.add(dto.getMenuLevel());
        }
        if (dto.getHasChild() != null) {
            sql.append(" AND t1.has_child = ? ");
            params.add(dto.getHasChild());
        }
        sql.append(" ORDER BY t1.menu_level,t1.menu_sort,t1.menu_status ASC ");
        return commonDao.findListBySql(pagination, sql, params, MenuRouteVO.class);
    }

    /**
     * 查询菜单树
     *
     * @param type （查询菜单树类型 1：根据递归获取菜单树(多次访问数据库)、2：根据所有菜单数据生成菜单树（访问一次数据库））
     * @return
     */
    @Override
    public List<Map<String, Object>> getMenuTree(int type) {
        List<Map<String, Object>> result = new ArrayList<>();
        if (1 == type) {
            // 根据递归获取菜单树(多次访问数据库)
            result = getMenuTreeByRecursion("");
        } else if (2 == type) {
            // 根据所有菜单数据生成菜单树
            List<Menu> menuList = menuRepository.findAllByMenuStatusOrderByMenuSortAsc(CommonConstant.YES);
            result = getMenuTreeByALL(menuList);
        }
        return result;
    }

    @Override
    public List<RouteVO> findRouteList() {
        List<Menu> menuList = menuRepository.findAll();
        return convertRouteVO(menuList);
    }

    private List<RouteVO> convertRouteVO(List<Menu> menuList) {
        return null;
    }

    @Override
    public String saveMenu(MenuRouteDTO dto) {
        Menu menu = new Menu();
        MenuRoute route = new MenuRoute();
        if (StringUtils.isEmpty(dto.getId())) {// 新增
            String menuId = CommonUtils.getUUID();
            menu.setId(menuId);
            menu.setCreateTime(new Date());

            route.setId(CommonUtils.getUUID());
            route.setMenuId(menuId);
            route.setCreateTime(new Date());
        } else {
            menu = menuRepository.findById(dto.getId()).orElse(new Menu());
            route = menuRouteRepository.getByMenuId(dto.getId());
        }
        menu.setParentId(dto.getParentId());
        menu.setMenuName(dto.getMenuName());
        menu.setMenuLevel(dto.getMenuLevel());
        menu.setMenuIcon(dto.getMenuIcon());
        menu.setMenuSort(dto.getMenuSort());
        menu.setMenuUrl(dto.getMenuUrl());
        menu.setMenuPath(dto.getMenuPath());
        menu.setMenuStatus(dto.getMenuStatus());
        menu.setHasChild(dto.getHasChild());
        menu.setUpdateTime(new Date());

        route.setName(getRouteName(dto.getMenuUrl()));
        route.setActiveMenu(dto.getActiveMenu());
        route.setComponent("Layout");
        route.setAlwaysShow(false);
        route.setHidden(false);
        route.setRedirect(dto.getRedirect());
        route.setPermission(dto.getPermission());
        route.setRoles(Arrays.toString(dto.getRoles()));
        route.setUpdateTime(new Date());
        menuRouteRepository.save(route);
        return menuRepository.save(menu).getId();
    }

    private String getRouteName(String menuUrl) {
        return null;
    }

    @Override
    public Menu getMenu(String id) {
        if (StringUtils.isBlank(id)) {
            throw new GlobalException("查询失败，id不能为空!");
        }
        return menuRepository.findById(id).orElse(new Menu());

    }

    @Override
    public void deleteMenu(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("删除失败，id不能为空!");
        }
        List<Menu> sysMenus = new ArrayList<>();
        Menu entity = menuRepository.findById(id).orElse(new Menu());
        sysMenus.add(entity);
        // 判断是否有子菜单
        sysMenus.addAll(findChildrenMenuList(id));
        menuRepository.deleteAll(sysMenus);

    }

    @Override
    public List<Menu> findParentMenuList() {
        return menuRepository.getAllByMenuLevelAndMenuStatus(MenuConstant.FIRST_LEVEL_MENU, CommonConstant.YES);
    }

    /**
     * 查询所有子菜单
     *
     * @param id
     * @return
     */
    public List<Menu> findChildrenMenuList(String id) {
        List<Menu> result = new ArrayList<>();
        // 判断是否有子菜单
        List<Menu> childrenList = menuRepository.getAllByParentIdAndMenuStatus(id, CommonConstant.YES);
        if (!CollectionUtils.isEmpty(childrenList)) {
            result.addAll(childrenList);
            for (Menu sysMenu : childrenList) {
                result.addAll(findChildrenMenuList(sysMenu.getId()));
            }

        }
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
        List<Menu> menuList;
        if (StringUtils.isEmpty(parentId)) {// 如果父菜单主键为空说明找的是一级菜单
            menuList = menuRepository.getAllByMenuLevelAndMenuStatus(MenuConstant.FIRST_LEVEL_MENU, CommonConstant.YES);
        } else {
            menuList = menuRepository.getAllByParentIdAndMenuStatus(parentId, CommonConstant.YES);
        }
        if (!CollectionUtils.isEmpty(menuList)) {
            for (Menu sysMenu : menuList) {
                parentId = sysMenu.getId();
                List<Map<String, Object>> childrenList = new ArrayList<>();
                if (sysMenu.getHasChild() == 1) {
                    // 递归获取子菜单
                    childrenList = getMenuTreeByRecursion(parentId);
                }
                // 转换菜单对象
                Map<String, Object> map = convertMapMenu(sysMenu, childrenList);
                menuMapList.add(map);
            }
        }
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
