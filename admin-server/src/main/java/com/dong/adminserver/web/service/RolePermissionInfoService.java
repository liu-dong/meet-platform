package com.dong.adminserver.web.service;

import com.dong.adminserver.web.model.dto.RolePermissionDTO;
import com.dong.commoncore.model.ResponseResult;

public interface RolePermissionInfoService {

    /**
     * 查询角色权限信息列表
     *
     * @param dto
     * @param limit
     * @param page
     * @return
     */
    ResponseResult findRolePermissionInfoList(RolePermissionDTO dto, Integer limit, Integer page);

    /**
     * 保存角色权限信息
     *
     * @param dto
     * @return
     */
    ResponseResult saveRolePermissionInfo(RolePermissionDTO dto);

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