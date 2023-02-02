package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.Role;
import com.dong.adminserver.web.model.dto.RoleDTO;
import com.dong.adminserver.web.model.vo.RoleVO;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;

public interface RoleService {

    /**
     * 查询角色信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<RoleVO> findRoleList(RoleDTO dto, Pager<RoleVO> pager);

    /**
     * 保存角色信息
     *
     * @param dto
     * @return
     */
    Role saveRole(RoleDTO dto);

    /**
     * 查询角色信息详细页面
     *
     * @param id
     * @return
     */
    Role getRoleDetail(String id);

    /**
     * 删除角色信息
     *
     * @param id
     */
    void deleteRole(String id);

    /**
     * 查询当前角色下账号信息
     *
     * @param dto
     * @return
     */
    ResponseResult findRoleAccountList(RoleDTO dto);

    /**
     * 查询角色权限信息
     *
     * @param dto
     * @return
     */
    ResponseResult findRolePermissionList(RoleDTO dto);

    /**
     * 给角色分配账号
     *
     * @param dto
     * @return
     */
    ResponseResult assignAccounts(RoleDTO dto);

    /**
     * 给角色分配权限
     *
     * @param dto
     * @return
     */
    ResponseResult assignPermissions(RoleDTO dto);
}