package com.dong.adminserver.web.service;

import com.dong.adminserver.web.model.MenuInfoBean;
import com.dong.commoncore.model.ResponseResult;

public interface MenuInfoService {


    /**
     * 查询菜单列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findMenuInfoList(MenuInfoBean bean, Integer limit, Integer page);

    /**
     * 查询菜单树
     *
     * @param type （查询菜单树类型 1：根据递归获取菜单树(多次访问数据库)、2：根据所有菜单数据生成菜单树（访问一次菜单））
     * @return
     */
    ResponseResult getMenuTree(int type);

    /**
     * 保存菜单信息
     *
     * @param bean
     * @return
     */
    ResponseResult saveMenuInfo(MenuInfoBean bean);

    /**
     * 查询菜单详细页面
     *
     * @param id
     * @return
     */
    ResponseResult getMenuInfo(String id);

    /**
     * 删除菜单信息
     *
     * @param id
     * @return
     */
    ResponseResult deleteMenuInfo(String id);

    /**
     * 获取父级菜单
     *
     * @return
     */
    ResponseResult findParentMenuInfoList();
}
