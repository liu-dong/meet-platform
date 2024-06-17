package com.dong.auth.web.service.impl;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.service.*;
import com.dong.commoncore.enums.LoginWayEnum;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.exception.UserException;
import com.dong.commoncore.model.UserDetail;
import com.dong.user.entity.Account;
import com.dong.user.service.AccountService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Autowired
    AccountService accountService;

    @Override
    @Transactional
    public String login(HttpServletRequest request, LoginDTO dto) {
        if (StringUtils.isBlank(dto.getCaptcha()) || StringUtils.isBlank(dto.getLoginWay())) {
            throw new GlobalException("登录方式和验证码不能为空！");
        }
        // 从登录方式工厂获取登录方式
        LoginWayService loginWayService = loginWayFactory.createLoginWayService(LoginWayEnum.valueOf(dto.getLoginWay().toUpperCase()));
        try {
            // 登录
            Account account = loginWayService.login(request, dto);
            // 修改登录时间
            accountService.updateLastLoginTime(account.getId());
            // 从认证模式工厂获取认证模式
            AuthenticationService authenticationService = authenticationFactory.createAuthModeService();
            // 认证
            return authenticationService.createAuthentication(request, account.getUserId());
        } catch (UserException e) {
            Integer loginFailCount = accountService.updateLoginFailCount(dto.getUsername());
            throw new UserException("第" + loginFailCount + "次登录失败，失败次数超过5次将锁定账号，失败原因：" + e.getMessage());
        }

    }

    @Override
    public void logout(HttpServletRequest request) {
        // 从认证模式工厂获取认证模式
        AuthenticationService authenticationService = authenticationFactory.createAuthModeService();
        // 使当前认证失效
        authenticationService.invalidAuthentication(request);
    }

}
