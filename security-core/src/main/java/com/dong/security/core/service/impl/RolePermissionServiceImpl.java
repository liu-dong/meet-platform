package com.dong.security.core.service.impl;

import com.dong.commoncore.model.ResponseResult;
import com.dong.security.core.model.dto.RolePermissionDTO;
import com.dong.security.core.service.RolePermissionService;
import org.springframework.stereotype.Service;

@Service
public class RolePermissionServiceImpl implements RolePermissionService {

    /**
     * 查询角色权限信息列表
     *
     * @param dto
     * @param limit
     * @param page
     * @return
     */
    @Override
    public ResponseResult findRolePermissionList(RolePermissionDTO dto, Integer limit, Integer page) {
        return null;
    }

    /**
     * 保存角色权限信息
     *
     * @param dto
     * @return
     */
    @Override
    public ResponseResult saveRolePermission(RolePermissionDTO dto) {
        return null;
    }

    /**
     * 查询角色权限信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult getRolePermission(String id) {
        return null;
    }

    /**
     * 删除角色权限信息
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult deleteRolePermission(String id) {
        return null;
    }

}
