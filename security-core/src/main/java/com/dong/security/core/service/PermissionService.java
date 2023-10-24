package com.dong.security.core.service;

import com.dong.commoncore.model.Pager;
import com.dong.security.core.entity.Permission;
import com.dong.security.core.model.dto.PermissionDTO;
import com.dong.security.core.model.vo.PermissionVO;

import java.util.List;
import java.util.Map;

public interface PermissionService {

    /**
     * 查询权限信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<PermissionVO> findPermissionList(PermissionDTO dto, Pager<PermissionVO> pager);

    /**
     * 查询权限树
     *
     * @param dto
     * @return
     */
    List<Map<String, Object>> getPermissionTree(PermissionDTO dto);

    /**
     * 保存权限信息
     *
     * @param dto
     * @return
     */
    Permission savePermission(PermissionDTO dto);

    /**
     * 查询权限信息详细页面
     *
     * @param id
     * @return
     */
    Permission getPermission(String id);

    /**
     * 删除权限信息
     *
     * @param id
     */
    void deletePermission(String id);
}