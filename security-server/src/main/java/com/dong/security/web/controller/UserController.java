package com.dong.security.web.controller;

import com.dong.security.web.service.UserService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户信息
 *
 * @author LD 2023/10/27
 */
@Api(tags = "登录注册")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 获取用户信息
     *
     * @param request
     * @return
     */
    @ApiOperation("获取用户信息")
    @GetMapping("/getUserDetail")
    public ResponseResult<UserDetail> getUserDetail(HttpServletRequest request) {
        // UserDetail user = userService.getUserDetail(request);
        UserDetail user = new UserDetail();
        return ResponseResult.success(user, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 修改用户密码
     *
     * @param request
     * @return
     */
    @GetMapping("/updatePassword")
    public ResponseResult<UserDetail> updatePassword(HttpServletRequest request) {
        UserDetail user = userService.updatePassword(request);
        return ResponseResult.success(user, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 注销用户
     *
     * @param username 用户名
     * @return 返回结果
     */
    @ApiOperation("注销用户")
    @PostMapping("/cancel")
    public ResponseResult<?> cancel(String username) {
        return userService.cancel(username);
    }

}
