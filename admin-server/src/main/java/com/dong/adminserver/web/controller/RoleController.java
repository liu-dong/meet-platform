package com.dong.adminserver.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.entity.UserRole;
import com.dong.user.entity.Role;
import com.dong.user.model.dto.RoleDTO;
import com.dong.user.model.vo.PermissionVO;
import com.dong.user.model.vo.RoleVO;
import com.dong.user.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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
     * @param pagination
     * @return
     */
    @ApiOperation("查询角色信息列表")
    @GetMapping("/findRoleList")
    public ResponseResult findRoleList(RoleDTO dto, Pagination pagination) {
        PageVO<RoleVO> roleList = roleService.findRoleList(dto, pagination);
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
        List<Map<String, Object>> roleAccountList = roleService.findRoleAccountList(dto);
        return ResponseResult.success(roleAccountList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询角色权限信息
     *
     * @param roleId
     * @return
     */
    @ApiOperation("查询角色权限信息")
    @GetMapping("/getPermissionList")
    public ResponseResult findRolePermissionList(String roleId) {
        List<PermissionVO> permissionVOList = roleService.findRolePermissionList(roleId);
        return ResponseResult.success(permissionVOList, ResponseMessageConstant.QUERY_SUCCESS);
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
        List<UserRole> userRoles = roleService.assignAccounts(dto);
        return ResponseResult.success(userRoles, ResponseMessageConstant.OPERATE_SUCCESS);
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
        String roleId = roleService.assignPermissions(dto);
        return ResponseResult.success(roleId, ResponseMessageConstant.OPERATE_SUCCESS);
    }


}
