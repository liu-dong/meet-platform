package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.Menu;
import com.dong.adminserver.web.model.dto.MenuDTO;
import com.dong.adminserver.web.model.vo.MenuVO;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;

import java.util.List;
import java.util.Map;

public interface MenuService {


    /**
     * 查询菜单列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    PageVO<MenuVO> findMenuList(MenuDTO dto, Pagination pagination);

    /**
     * 查询菜单树
     *
     * @param type （查询菜单树类型 1：根据递归获取菜单树(多次访问数据库)、2：根据所有菜单数据生成菜单树（访问一次菜单））
     * @return
     */
    List<Map<String, Object>> getMenuTree(int type);

    /**
     * 保存菜单信息
     *
     * @param dto
     * @return
     */
    Menu saveMenu(MenuDTO dto);

    /**
     * 查询菜单详细页面
     *
     * @param id
     * @return
     */
    Menu getMenu(String id);

    /**
     * 删除菜单信息
     *
     * @param id
     */
    void deleteMenu(String id);

    /**
     * 获取父级菜单
     *
     * @return
     */
    List<Menu> findParentMenuList();
}
