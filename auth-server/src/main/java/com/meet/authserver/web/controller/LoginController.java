package com.meet.authserver.web.controller;

import com.meet.authserver.web.service.LoginService;
import com.meet.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录注册
 *
 * @author LD 2021/5/18
 */
@Api(tags = "登录注册")
@RestController
public class LoginController {

    @Autowired
    LoginService loginService;

    /**
     * 退出登录
     *
     * @param username 用户名
     * @return 返回结果
     */
    @ApiOperation("退出登录")
    @PostMapping("/logout")
    public ResponseResult logout(String username) {
        return loginService.logout(username);
    }

    /**
     * 注销用户
     *
     * @param username 用户名
     * @return 返回结果
     */
    @ApiOperation("注销用户")
    @PostMapping("/cancel")
    public ResponseResult cancel(String username) {
        return loginService.cancel(username);
    }
}
