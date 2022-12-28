package com.dong.adminserver.web.service;

import com.dong.adminserver.web.model.RolePermissionInfoBean;
import com.dong.commoncore.model.ResponseResult;

public interface RolePermissionInfoService {

    /**
     * 查询角色权限信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findRolePermissionInfoList(RolePermissionInfoBean bean, Integer limit, Integer page);

    /**
     * 保存角色权限信息
     *
     * @param bean
     * @return
     */
    ResponseResult saveRolePermissionInfo(RolePermissionInfoBean bean);

    /**
     * 查询角色权限信息详细页面
     *
     * @param id
     * @return
     */
    ResponseResult getRolePermissionInfo(String id);

    /**
     * 删除角色权限信息
     *
     * @param id
     * @return
     */
    ResponseResult deleteRolePermissionInfo(String id);
}