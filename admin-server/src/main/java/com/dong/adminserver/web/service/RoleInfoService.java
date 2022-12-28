package com.dong.adminserver.web.service;

import com.dong.adminserver.web.model.RoleInfoBean;
import com.dong.commoncore.model.ResponseResult;

public interface RoleInfoService {

    /**
     * 查询角色信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findRoleInfoList(RoleInfoBean bean, Integer limit, Integer page);

    /**
     * 保存角色信息
     *
     * @param bean
     * @return
     */
    ResponseResult saveRoleInfo(RoleInfoBean bean);

    /**
     * 查询角色信息详细页面
     *
     * @param id
     * @return
     */
    ResponseResult getRoleInfo(String id);

    /**
     * 删除角色信息
     *
     * @param id
     * @return
     */
    ResponseResult deleteRoleInfo(String id);

    /**
     * 查询当前角色下账号信息
     *
     * @param bean
     * @return
     */
    ResponseResult findRoleAccountInfoList(RoleInfoBean bean);

    /**
     * 查询角色权限信息
     *
     * @param bean
     * @return
     */
    ResponseResult findRolePermissionInfoList(RoleInfoBean bean);

    /**
     * 给角色分配账号
     *
     * @param bean
     * @return
     */
    ResponseResult assignAccounts(RoleInfoBean bean);

    /**
     * 给角色分配权限
     *
     * @param bean
     * @return
     */
    ResponseResult assignPermissions(RoleInfoBean bean);
}