package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.model.RolePermissionInfoBean;
import com.dong.adminserver.web.service.RolePermissionInfoService;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.stereotype.Service;

@Service
public class RolePermissionInfoServiceImpl implements RolePermissionInfoService {

    /**
     * 查询角色权限信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @Override
    public ResponseResult findRolePermissionInfoList(RolePermissionInfoBean bean, Integer limit, Integer page) {
        return null;
    }

    /**
     * 保存角色权限信息
     *
     * @param bean
     * @return
     */
    @Override
    public ResponseResult saveRolePermissionInfo(RolePermissionInfoBean bean) {
        return null;
    }

    /**
     * 查询角色权限信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult getRolePermissionInfo(String id) {
        return null;
    }

    /**
     * 删除角色权限信息
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult deleteRolePermissionInfo(String id) {
        return null;
    }

}