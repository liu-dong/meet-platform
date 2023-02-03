package com.dong.securitycore.service.impl;

import com.dong.commoncore.model.ResponseResult;
import com.dong.securitycore.model.dto.RolePermissionDTO;
import com.dong.securitycore.service.RolePermissionInfoService;
import org.springframework.stereotype.Service;

@Service
public class RolePermissionInfoServiceImpl implements RolePermissionInfoService {

    /**
     * 查询角色权限信息列表
     *
     * @param dto
     * @param limit
     * @param page
     * @return
     */
    @Override
    public ResponseResult findRolePermissionInfoList(RolePermissionDTO dto, Integer limit, Integer page) {
        return null;
    }

    /**
     * 保存角色权限信息
     *
     * @param dto
     * @return
     */
    @Override
    public ResponseResult saveRolePermissionInfo(RolePermissionDTO dto) {
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