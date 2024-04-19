package com.dong.auth.web.service.impl;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.service.LoginService;
import com.dong.auth.web.service.UserService;
import com.dong.commoncore.exception.GlobalException;
import com.dong.user.entity.Account;
import com.google.code.kaptcha.Constants;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author liudong 2024/4/19
 */
public abstract class AbstractLoginService implements LoginService {

    @Autowired
    protected UserService userService;

    @Override
    public String login(HttpServletRequest request, LoginDTO dto) {
        if (StringUtils.isBlank(dto.getUsername()) || StringUtils.isBlank(dto.getPassword())) {
            throw new GlobalException("用户名和密码不能为空");
        }
        // 校验验证码
        verificationCode(request, dto);
        Account account = userService.getAccountByUsername(dto.getUsername());
        if (account == null) {
            throw new GlobalException("无此用户");
        }
        if (!dto.getPassword().equals(account.getPassword())) {
            throw new GlobalException("密码错误");
        }
        return this.createAuthentication(request, account);
    }

    @Override
    public void logout(HttpServletRequest request) {
        this.invalidAuthentication(request);
    }

    /**
     * 验证码校验
     *
     * @param request
     * @param dto
     */
    public void verificationCode(HttpServletRequest request, LoginDTO dto) {
        String paramCaptcha = dto.getCaptcha();
        // 用于开发测试
        if ("1".equals(paramCaptcha)) {
            return;
        }
        HttpSession session = request.getSession();
        String savedCode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (StringUtils.isNotBlank(savedCode)) {
            session.removeAttribute(Constants.KAPTCHA_SESSION_KEY);
        }
        if (StringUtils.isBlank(paramCaptcha) || StringUtils.isBlank(savedCode) || !paramCaptcha.equalsIgnoreCase(savedCode)) {
            throw new GlobalException(500, "验证码校验失败");
        }

    }

    /**
     * 创建认证信息
     *
     * @param request
     * @param account
     * @return
     */
    protected abstract String createAuthentication(HttpServletRequest request, Account account);

    /**
     * 使当前认证失效
     *
     * @param request
     */
    protected abstract void invalidAuthentication(HttpServletRequest request);
}
