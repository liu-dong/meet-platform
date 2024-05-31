package com.dong.auth.web.service.impl;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.service.*;
import com.dong.commoncore.enums.LoginWayEnum;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.UserDetail;
import com.dong.user.entity.Account;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * 登录
 *
 * @author liudong 2024/4/19
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    AbstractLoginWayFactory loginWayFactory;

    @Autowired
    AbstractAuthenticationFactory authenticationFactory;

    @Override
    public String login(HttpServletRequest request, LoginDTO dto) {
        if (StringUtils.isBlank(dto.getCaptcha()) || StringUtils.isBlank(dto.getLoginWay())) {
            throw new GlobalException("登录方式和验证码不能为空！");
        }
        // 从登录方式工厂获取登录方式
        LoginWayService loginWayService = loginWayFactory.createLoginWayService(LoginWayEnum.valueOf(dto.getLoginWay().toUpperCase()));
        // 登录
        Account account = loginWayService.login(request, dto);
        // 从认证模式工厂获取认证模式
        AuthenticationService authenticationService = authenticationFactory.createAuthModeService();
        // 认证
        return authenticationService.createAuthentication(request, account.getUserId());
    }

    @Override
    public void logout(HttpServletRequest request) {
        // 从认证模式工厂获取认证模式
        AuthenticationService authenticationService = authenticationFactory.createAuthModeService();
        // 使当前认证失效
        authenticationService.invalidAuthentication(request);
    }

}
