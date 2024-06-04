package com.dong.adminserver.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.entity.Role;
import com.dong.user.model.dto.RoleDTO;
import com.dong.user.model.vo.RoleVO;
import com.dong.user.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
    public ResponseResult<PageVO<RoleVO>> findRoleList(RoleDTO dto, Pagination pagination) {
        PageVO<RoleVO> roleList = roleService.findRoleList(dto, pagination);
        return ResponseResult.success(roleList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询所有角色
     *
     * @return 角色id-角色名称的键值对
     */
    @GetMapping("/findAllRoleListMap")
    public ResponseResult<List<Map<String, String>>> findAllRoleListMap() {
        List<Map<String, String>> roleList = roleService.findAllRoleListMap();
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
     * @param roleCode
     * @return
     */
    @ApiOperation("查询角色权限信息")
    @GetMapping("/findRolePermissionList")
    public ResponseResult<Set<String>> findRolePermissionList(String roleCode) {
        Set<String> permissionCodes = roleService.findRolePermissionList(roleCode);
        return ResponseResult.success(permissionCodes, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 分派账号
     *
     * @param dto
     * @return
     */
    @ApiOperation("分派账号")
    @PostMapping("/assignAccounts")
    public ResponseResult<?> assignAccounts(@RequestBody RoleDTO dto) {
        roleService.assignAccounts(dto);
        return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
    }

    /**
     * 分派权限
     *
     * @param dto
     * @return
     */
    @ApiOperation("分派权限")
    @PostMapping("/assignPermissions")
    public ResponseResult<?> assignPermissions(@RequestBody RoleDTO dto) {
        roleService.assignPermissions(dto.getRoleCode(), dto.getPermissionCodeList());
        return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
    }


}
