package com.dong.auth.web.service;

import com.dong.auth.web.model.LoginDTO;
import com.dong.commoncore.constant.RedisCacheKeyConstant;
import com.dong.commoncore.enums.AccountStatusEnum;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.exception.UserException;
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
    public Account login(HttpServletRequest request, LoginDTO dto) {
        // 校验验证码
        verificationCode(request, dto);
        if (StringUtils.isBlank(dto.getUsername()) || StringUtils.isBlank(dto.getPassword())) {
            throw new UserException("用户名和密码不能为空！");
        }
        Account account = accountRepository.getAccountByUsername(dto.getUsername());
        if (account == null) {
            throw new UserException("无此用户");
        }
        if (account.getAccountStatus().equals(AccountStatusEnum.DISABLE.getCode())) {
            throw new UserException("账号锁定");
        }
        if (!dto.getPassword().equals(account.getPassword())) {
            throw new UserException("密码错误");
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
    public Account login(HttpServletRequest request, LoginDTO dto) {
        if (StringUtils.isBlank(dto.getPhone())) {
            throw new GlobalException("手机号不能为空！");
        }
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
        } else {
            // 登录成功删除验证码
            RedisUtil.del(RedisCacheKeyConstant.EMAIL_CODE_PATH + dto.getEmail());
        }
        return account;
    }
}

@Service
class EmailLoginWayServiceImpl implements LoginWayService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public Account login(HttpServletRequest request, LoginDTO dto) {
        if (StringUtils.isBlank(dto.getEmail())) {
            throw new GlobalException("邮箱不能为空！");
        }
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
        } else {
            // 登录成功删除验证码
            RedisUtil.del(RedisCacheKeyConstant.EMAIL_CODE_PATH + dto.getEmail());
        }
        return account;
    }
}
