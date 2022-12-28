package com.dong.adminserver.web.service;

import com.dong.adminserver.web.model.PermissionInfoBean;
import com.dong.commoncore.model.ResponseResult;

public interface PermissionInfoService {

    /**
     * 查询权限信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findPermissionInfoList(PermissionInfoBean bean, Integer limit, Integer page);

    /**
     * 查询权限树
     *
     * @param bean
     * @return
     */
    ResponseResult getPermissionTree(PermissionInfoBean bean);

    /**
     * 保存权限信息
     *
     * @param bean
     * @return
     */
    ResponseResult savePermissionInfo(PermissionInfoBean bean);

    /**
     * 查询权限信息详细页面
     *
     * @param id
     * @return
     */
    ResponseResult getPermissionInfo(String id);

    /**
     * 删除权限信息
     *
     * @param id
     * @return
     */
    ResponseResult deletePermissionInfo(String id);
}