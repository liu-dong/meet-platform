package com.dong.auth.web.service;

import com.dong.auth.web.model.EmailLoginDTO;
import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.model.PhoneLoginDTO;
import com.dong.auth.web.model.UsernameLoginDTO;
import com.dong.commoncore.constant.RedisCacheKeyConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.util.RedisUtil;
import com.dong.user.dao.AccountRepository;
import com.dong.user.entity.Account;
import com.google.code.kaptcha.Constants;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author liudong 2024/4/20
 */
public interface LoginWayService {

    Account login(HttpServletRequest request, LoginDTO dto);
}

@Service
class UsernameLoginWayServiceImpl implements LoginWayService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public Account login(HttpServletRequest request, LoginDTO loginDTO) {
        if (!(loginDTO instanceof UsernameLoginDTO)) {
            throw new GlobalException("登录参数错误");
        }
        // 校验验证码
        verificationCode(request, loginDTO);
        UsernameLoginDTO dto = (UsernameLoginDTO) loginDTO;
        Account account = accountRepository.getAccountByUsername(dto.getUsername());
        if (account == null) {
            throw new GlobalException("无此用户");
        }
        if (!dto.getPassword().equals(account.getPassword())) {
            throw new GlobalException("密码错误");
        }
        return account;
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
}
@Service
class PhoneLoginWayServiceImpl implements LoginWayService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public Account login(HttpServletRequest request, LoginDTO loginDTO) {
        if (!(loginDTO instanceof PhoneLoginDTO)) {
            throw new GlobalException("登录参数错误");
        }
        PhoneLoginDTO dto = (PhoneLoginDTO) loginDTO;
        Account account = accountRepository.getByPhone(dto.getPhone());
        if (account == null) {
            throw new GlobalException("无此用户");
        }
        // 获取验证码
        String code = RedisUtil.get(RedisCacheKeyConstant.PHONE_CODE_PATH + dto.getPhone());
        if (StringUtils.isBlank(code)) {
            throw new GlobalException("验证码失效");
        }
        if (!dto.getCaptcha().equals(code)) {
            throw new GlobalException("验证码错误");
        }
        return account;
    }
}
@Service
class EmailLoginWayServiceImpl implements LoginWayService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public Account login(HttpServletRequest request, LoginDTO loginDTO) {
        if (!(loginDTO instanceof EmailLoginDTO)) {
            throw new GlobalException("登录参数错误");
        }
        EmailLoginDTO dto = (EmailLoginDTO) loginDTO;

        Account account = accountRepository.getByEmail(dto.getEmail());
        if (account == null) {
            throw new GlobalException("无此用户");
        }
        // 获取验证码
        String code = RedisUtil.get(RedisCacheKeyConstant.EMAIL_CODE_PATH + dto.getEmail());
        if (StringUtils.isBlank(code)) {
            throw new GlobalException("验证码失效");
        }
        if (!dto.getCaptcha().equals(code)) {
            throw new GlobalException("验证码错误");
        }
        return account;
    }
}
