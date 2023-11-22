package com.dong.adminserver.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.entity.Role;
import com.dong.user.model.dto.RoleDTO;
import com.dong.user.model.vo.RoleVO;
import com.dong.user.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 角色信息管理
 *
 * @author LD
 */
@Api(tags = "角色信息管理模块")
@RestController
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    /**
     * 查询角色信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @ApiOperation("查询角色信息列表")
    @GetMapping("/findRoleList")
    public ResponseResult findRoleList(RoleDTO dto, Pager<RoleVO> pager) {
        Pager<RoleVO> roleList = roleService.findRoleList(dto, pager);
        return ResponseResult.success(roleList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存角色信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存角色信息")
    @PostMapping("/saveRole")
    public ResponseResult saveRole(@RequestBody RoleDTO dto) {
        Role role = roleService.saveRole(dto);
        return ResponseResult.success(role, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询角色信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询角色信息")
    @GetMapping("/getRoleDetail")
    public ResponseResult getRoleDetail(String id) {
        Role role = roleService.getRoleDetail(id);
        return ResponseResult.success(role, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除角色信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除角色信息")
    @PostMapping("/deleteRole")
    public ResponseResult deleteRole(String id) {
        roleService.deleteRole(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }

    /**
     * 查询角色账号信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("查询角色账号信息")
    @GetMapping("/findRoleAccountList")
    public ResponseResult findRoleAccountList(RoleDTO dto) {
        return roleService.findRoleAccountList(dto);
    }

    /**
     * 查询角色权限信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("查询角色权限信息")
    @GetMapping("/findRolePermissionList")
    public ResponseResult findRolePermissionList(RoleDTO dto) {
        return roleService.findRolePermissionList(dto);
    }

    /**
     * 分派账号
     *
     * @param dto
     * @return
     */
    @ApiOperation("分派账号")
    @PostMapping("/assignAccounts")
    public ResponseResult assignAccounts(@RequestBody RoleDTO dto) {
        return roleService.assignAccounts(dto);
    }

    /**
     * 分派权限
     *
     * @param dto
     * @return
     */
    @ApiOperation("分派权限")
    @PostMapping("/assignPermissions")
    public ResponseResult assignPermissions(@RequestBody RoleDTO dto) {
        return roleService.assignPermissions(dto);
    }


}
