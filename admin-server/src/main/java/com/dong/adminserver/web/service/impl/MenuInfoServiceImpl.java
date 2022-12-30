package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.MenuJpaDao;
import com.dong.adminserver.web.entity.Menu;
import com.dong.adminserver.web.model.MenuInfoBean;
import com.dong.adminserver.web.service.MenuInfoService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class MenuInfoServiceImpl implements MenuInfoService {

    @Autowired
    private MenuJpaDao menuJpaDao;

    @Autowired
    private CommonDao commonDao;

    /**
     * 查询菜单列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @Override
    public ResponseResult findMenuInfoList(MenuInfoBean bean, Integer limit, Integer page) {
        ResponseResult result = new ResponseResult();
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT sm.id, sm.parent_id parentId, sm.menu_name menuName, sm.menu_level menuLevel, ");
        sql.append(" sm.menu_icon menuIcon, sm.menu_order menuOrder, sm.menu_url menuUrl, ");
        sql.append(" sm.menu_path menuPath, sm.menu_status menuStatus, sm.has_child hasChild ");
        sql.append(" FROM sys_menu sm ");
        sql.append(" INNER JOIN permission p ON p.resource_id = sm.id ");
        sql.append(" INNER JOIN role_permission rp ON rp.permission_id = p.id ");
        sql.append(" INNER JOIN account_role ar ON ar.role_id = rp.role_id ");
        sql.append(" INNER JOIN account a ON a.id = ar.account_id ");
        sql.append(" WHERE 1 = 1 ");
        if (!StringUtils.isEmpty(bean.getMenuStatus())) {
            sql.append(" AND sm.menu_status = ? ");
            param.add(bean.getMenuStatus());
        }
        if (!StringUtils.isEmpty(bean.getHasChild())) {
            sql.append(" AND sm.has_child = ? ");
            param.add(bean.getHasChild());
        }
        sql.append(" ORDER BY sm.menu_level,sm.menu_order ASC ");
        int total = commonDao.getTotalBySql(sql, param);
        if (total > 0) {
            List<Map<String, Object>> dataList = commonDao.findListMapBySql(sql, param, page, limit);
            result.setData(dataList);

            result.setMessage("查询成功！");
        }

        return result;
    }

    /**
     * 查询菜单树
     *
     * @param type （查询菜单树类型 1：根据递归获取菜单树(多次访问数据库)、2：根据所有菜单数据生成菜单树（访问一次数据库））
     * @return
     */
    @Override
    public ResponseResult getMenuTree(int type) {
        if (1 == type) {
            return ResponseResult.success(getMenuTreeByRecursion(""), "查询成功!");
        } else if (2 == type) {
            List<Menu> sysMenuList = menuJpaDao.findAllByOrderByMenuOrderAsc();
            return ResponseResult.success(getMenuTreeByALL(sysMenuList), "查询成功!");
        }
        return ResponseResult.error("查询失败!");
    }

    @Override
    public ResponseResult saveMenuInfo(MenuInfoBean bean) {
        Menu entity = new Menu();
        if (StringUtils.isEmpty(bean.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = menuJpaDao.getOne(bean.getId());
            entity.setUpdateTime(new Date());
        }
        entity.setParentId(bean.getParentId());
        entity.setMenuName(bean.getMenuName());
        entity.setMenuLevel(bean.getMenuLevel());
        entity.setMenuIcon(bean.getMenuIcon());
        entity.setMenuOrder(bean.getMenuOrder());
        entity.setMenuUrl(bean.getMenuUrl());
        entity.setMenuPath(bean.getMenuPath());
        entity.setMenuStatus(bean.getMenuStatus());
        entity.setHasChild(bean.getHasChild());
        entity.setUpdateTime(new Date());
        entity = menuJpaDao.save(entity);
        return ResponseResult.success(entity, "保存成功!");
    }

    @Override
    public ResponseResult getMenuInfo(String id) {
        if (StringUtils.isEmpty(id)) {
            return ResponseResult.error("查询失败，id不能为空!");
        } else {
            Menu entity = menuJpaDao.getOne(id);
            return ResponseResult.success(entity, "查询成功!");
        }
    }

    @Override
    public ResponseResult deleteMenuInfo(String id) {
        if (StringUtils.isEmpty(id)) {
            return ResponseResult.error("删除失败，id不能为空!");
        } else {
            List<Menu> sysMenus = new ArrayList<>();
            Menu entity = menuJpaDao.getOne(id);
            sysMenus.add(entity);
            //判断是否有子菜单
            sysMenus.addAll(findChildrenMenuInfoList(id));
            //menuJpaDao.deleteAll(sysMenus);
            return ResponseResult.success(null, "删除成功!");
        }
    }

    @Override
    public ResponseResult findParentMenuInfoList() {
        List<Menu> menuList = menuJpaDao.getAllByMenuLevel(1);
        return ResponseResult.success(menuList, "查询成功!");
    }

    /**
     * 查询所有子菜单
     *
     * @param id
     * @return
     */
    public List<Menu> findChildrenMenuInfoList(String id) {
        List<Menu> result = new ArrayList<>();
        //判断是否有子菜单
        List<Menu> childrenList = menuJpaDao.getAllByParentId(id);
        if (!CollectionUtils.isEmpty(childrenList)) {
            result.addAll(childrenList);
            for (Menu sysMenu : childrenList) {
                result.addAll(findChildrenMenuInfoList(sysMenu.getId()));
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
        List<Map<String, Object>> menuList = new ArrayList<>();
        List<Menu> sysMenuList;
        if (StringUtils.isEmpty(parentId)) {//如果父菜单主键为空说明找的是一级菜单
            sysMenuList = menuJpaDao.getAllByMenuLevel(1);
        } else {
            sysMenuList = menuJpaDao.getAllByParentId(parentId);
        }
        if (!CollectionUtils.isEmpty(sysMenuList)) {
            for (Menu sysMenu : sysMenuList) {
                parentId = sysMenu.getId();
                List<Map<String, Object>> childrenList = new ArrayList<>();
                if (sysMenu.getHasChild() == 1) {
                    childrenList = getMenuTreeByRecursion(parentId);
                }
                Map<String, Object> map = setMenu(sysMenu, childrenList);//生成菜单对象
                menuList.add(map);
            }
        }
        return menuList;
    }

    /**
     * 根据所有菜单数据生成菜单树（访问一次菜单）
     *
     * @param sysMenuList
     * @return
     */
    @SuppressWarnings("AlibabaLowerCamelCaseVariableNaming")
    public List<Map<String, Object>> getMenuTreeByALL(List<Menu> sysMenuList) {
        List<Map<String, Object>> result = new ArrayList<>();
        for (Menu sysMenu : sysMenuList) {
            if (sysMenu.getMenuLevel() == 1) {
                Map<String, Object> map = setMenu(sysMenu, null);
                if (sysMenu.getHasChild() == 1) {
                    map.put("children", getChildrenMenuByRecursion(sysMenuList, map));//获取子菜单
                }
                result.add(map);
            }
        }
        return result;
    }

    /**
     * 递归获取子菜单
     *
     * @param sysMenuList
     * @param parentMenu
     * @return
     */
    private List<Map<String, Object>> getChildrenMenuByRecursion(List<Menu> sysMenuList, Map<String, Object> parentMenu) {
        List<Map<String, Object>> childrenList = new ArrayList<>();//子菜单列表
        for (Menu menu : sysMenuList) {
            if (!StringUtils.isEmpty(menu.getParentId()) && parentMenu.get("id").equals(menu.getParentId())) {
                Map<String, Object> childrenMenu = setMenu(menu, null);
                childrenMenu.put("children", getChildrenMenuByRecursion(sysMenuList, childrenMenu));
                childrenList.add(childrenMenu);
            }
        }
        return childrenList;
    }

    /**
     * 生成一个菜单对象
     *
     * @param sysMenu
     * @param childrenList
     * @return
     */
    private Map<String, Object> setMenu(Menu sysMenu, List<Map<String, Object>> childrenList) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", sysMenu.getId());
        map.put("title", sysMenu.getMenuName());
        map.put("url", sysMenu.getMenuUrl());
        map.put("icon", sysMenu.getMenuIcon());
        map.put("order", sysMenu.getMenuOrder());
        map.put("children", childrenList);
        return map;
    }
}
