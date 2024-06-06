package com.dong.admin.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import com.dong.user.entity.UserRole;
import com.dong.user.model.dto.UserDTO;
import com.dong.user.model.dto.UserRoleDTO;
import com.dong.user.model.vo.UserVO;
import com.dong.user.service.AccountService;
import com.dong.user.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户管理
 *
 * @author LD
 * @date 2020/3/22 20:59
 */
@Api(tags = "用户管理模块")
@RequestMapping("/user")
@RestController
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    AccountService accountService;

    /**
     * 查询用户信息列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @ApiOperation("查询用户信息列表")
    @GetMapping("/findUserList")
    public ResponseResult<PageVO<UserVO>> findUserList(UserDTO dto, Pagination pagination) {
        PageVO<UserVO> userList = userService.findUserList(dto, pagination);
        return ResponseResult.success(userList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 查询用户信息
     *
     * @param id
     * @return
     */
    @ApiOperation("查询用户信息")
    @GetMapping("/getUser")
    public ResponseResult<UserDetail> getUser(String id) {
        UserDetail user = userService.getUserDetail(id);
        return ResponseResult.success(user, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除用户信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除用户信息")
    @PostMapping("/deleteUser")
    public ResponseResult<?> deleteUser(String id) {
        userService.deleteUser(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }

    /**
     * 根据用户id查询角色信息
     *
     * @param userId
     * @return
     */

    @ApiOperation("查询角色用户信息")
    @GetMapping("/findUserRoleList")
    public ResponseResult<List<String>> findUserRoleList(String userId) {
        List<String> dataList = userService.findUserRoleList(userId);
        return ResponseResult.success(dataList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 分派角色
     *
     * @param dto
     * @return
     */
    @ApiOperation("分派角色")
    @PostMapping("/assignRoles")
    public ResponseResult<List<UserRole>> assignRoles(@RequestBody UserRoleDTO dto) {
        List<UserRole> userRoles = userService.assignRoles(dto.getUserId(), dto.getRoleCodes());
        return ResponseResult.success(userRoles, ResponseMessageConstant.OPERATE_SUCCESS);
    }

}
