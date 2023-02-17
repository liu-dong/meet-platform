package com.dong.authserver.web.controller;

import com.dong.authserver.web.model.LoginDTO;
import com.dong.authserver.web.service.LoginService;
import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录认证
 *
 * @author LD 2021/5/18
 */
@Api(tags = "Session登录认证")
@RestController
@RequestMapping("/session")
public class LoginSessionController {

    @Value("${session.expiration.time}")
    private Integer expirationTime;

    @Autowired
    LoginService loginService;


    /**
     * 登录
     *
     * @param dto
     * @return
     */
    @ApiOperation("登录")
    @PostMapping("/login")
    public ResponseResult login(HttpServletRequest request, HttpServletResponse response, @RequestBody LoginDTO dto) {
        UserDetail userDetail = loginService.getUserDetail(dto);

        HttpSession session = request.getSession();
        //用户信息放入session
        session.setAttribute("userDetail", userDetail);
        //设置session过期时间，以秒为单位
        session.setMaxInactiveInterval(expirationTime);
        return ResponseResult.success(userDetail.getUsername() + ResponseMessageConstant.LOGIN_SUCCESS);
    }


    /**
     * 获取用户信息
     *
     * @param request
     * @return
     */
    @ApiOperation("获取用户信息")
    @GetMapping("/getUserDetail")
    public ResponseResult getUserDetail(HttpServletRequest request) {
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        if (userDetail == null) {
            return ResponseResult.error("无用户信息");
        }
        return ResponseResult.success(userDetail, ResponseMessageConstant.QUERY_SUCCESS);
    }

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

}
