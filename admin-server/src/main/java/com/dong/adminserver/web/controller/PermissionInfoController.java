package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.entity.Permission;
import com.dong.adminserver.web.model.dto.PermissionDTO;
import com.dong.adminserver.web.model.vo.PermissionVO;
import com.dong.adminserver.web.service.PermissionInfoService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
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
@RequestMapping("/permissionInfo")
public class PermissionInfoController {

    @Autowired
    private PermissionInfoService permissionInfoService;

    /**
     * 查询权限信息列表
     *
     * @return
     */
    @ApiOperation("查询权限信息列表")
    @PostMapping("/findPermissionInfoList")
    public ResponseResult findPermissionInfoList(PermissionDTO dto, Pager<PermissionVO> pager) {
        Pager<PermissionVO> permissionList = permissionInfoService.findPermissionInfoList(dto, pager);
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
        List<Map<String, Object>> permissionTree = permissionInfoService.getPermissionTree(dto);
        return ResponseResult.success(permissionTree, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存权限信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存权限信息")
    @PostMapping("/savePermissionInfo")
    public ResponseResult savePermissionInfo(@RequestBody PermissionDTO dto) {
        Permission permission = permissionInfoService.savePermissionInfo(dto);
        return ResponseResult.success(permission, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询权限详细信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询权限详细信息")
    @GetMapping("/getPermissionInfo")
    public ResponseResult getPermissionInfo(String id) {
        Permission permission = permissionInfoService.getPermissionInfo(id);
        return ResponseResult.success(permission, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除权限信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除权限信息")
    @PostMapping("/deletePermissionInfo")
    public ResponseResult deletePermissionInfo(String id) {
        permissionInfoService.deletePermissionInfo(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }
}
