package com.dong.securitycore.service;

import com.dong.commoncore.model.ResponseResult;
import com.dong.securitycore.model.dto.RolePermissionDTO;

public interface RolePermissionService {

    /**
     * 查询角色权限信息列表
     *
     * @param dto
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findRolePermissionList(RolePermissionDTO dto, Integer limit, Integer page);

    /**
     * 保存角色权限信息
     *
     * @param dto
     * @return
     */
    ResponseResult saveRolePermission(RolePermissionDTO dto);

    /**
     * 查询角色权限信息详细页面
     *
     * @param id
     * @return
     */
    ResponseResult getRolePermission(String id);

    /**
     * 删除角色权限信息
     *
     * @param id
     * @return
     */
    ResponseResult deleteRolePermission(String id);
}
