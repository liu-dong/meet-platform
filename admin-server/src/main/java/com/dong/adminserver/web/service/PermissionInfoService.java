package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.Permission;
import com.dong.adminserver.web.model.dto.PermissionDTO;
import com.dong.adminserver.web.model.vo.PermissionVO;
import com.dong.commoncore.model.Pager;

import java.util.List;
import java.util.Map;

public interface PermissionInfoService {

    /**
     * 查询权限信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<PermissionVO> findPermissionInfoList(PermissionDTO dto, Pager<PermissionVO> pager);

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
    Permission savePermissionInfo(PermissionDTO dto);

    /**
     * 查询权限信息详细页面
     *
     * @param id
     * @return
     */
    Permission getPermissionInfo(String id);

    /**
     * 删除权限信息
     *
     * @param id
     */
    void deletePermissionInfo(String id);
}