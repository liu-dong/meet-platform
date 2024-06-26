package com.dong.admin.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.entity.Permission;
import com.dong.user.model.dto.PermissionDTO;
import com.dong.user.model.vo.PermissionVO;
import com.dong.user.service.PermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 菜单管理模块
 *
 * @author LD
 */
@Api(tags = "权限管理模块")
@RestController
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 查询权限信息列表
     *
     * @return
     */
    @ApiOperation("查询权限信息列表")
    @GetMapping("/findPermissionList")
    public ResponseResult findPermissionList(PermissionDTO dto, Pagination pagination) {
        PageVO<PermissionVO> permissionList = permissionService.findPermissionList(dto, pagination);
        return ResponseResult.success(permissionList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询权限树
     *
     * @return
     */
    @ApiOperation("查询权限树")
    @GetMapping("/getPermissionTree")
    public ResponseResult getPermissionTree(PermissionDTO dto) {
        List<Map<String, Object>> permissionTree = permissionService.getPermissionTree(dto);
        return ResponseResult.success(permissionTree, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存权限信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存权限信息")
    @PostMapping("/savePermission")
    public ResponseResult savePermission(@RequestBody PermissionDTO dto) {
        Permission permission = permissionService.savePermission(dto);
        return ResponseResult.success(permission, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询权限详细信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询权限详细信息")
    @GetMapping("/getPermission")
    public ResponseResult<PermissionVO> getPermission(String id) {
        PermissionVO permission = permissionService.getPermission(id);
        return ResponseResult.success(permission, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除权限信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除权限信息")
    @PostMapping("/deletePermission")
    public ResponseResult deletePermission(String id) {
        permissionService.deletePermission(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
