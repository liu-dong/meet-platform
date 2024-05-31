package com.dong.auth.web.service.impl;

import com.dong.auth.web.service.SecurityCodeService;
import com.dong.commoncore.constant.RedisCacheKeyConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.util.EmailUtils;
import com.dong.commoncore.util.RedisUtil;
import com.dong.commoncore.util.RegularCheckUtils;
import com.dong.user.dao.AccountRepository;
import com.dong.user.entity.Account;
import com.dong.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
class SecurityCodeServiceImpl implements SecurityCodeService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public String sendSecurityCode(String number) {
        String code = null;
        if (RegularCheckUtils.isEmail(number)) {
            code = sendSecurityCodeToEmail(number);
        }
        if (RegularCheckUtils.isMobile(number)) {
            code = sendSecurityCodeToPhone(number);
        }
        if (code == null) {
            throw new GlobalException("验证码获取失败！");
        }
        return code;
    }

    public String sendSecurityCodeToEmail(String number) {
        Account account = accountRepository.getByEmail(number);
        if (account == null) {
            throw new GlobalException("邮箱不存在！");
        }

        String code;
        try {
            code = EmailUtils.sendSecurityCode(account.getEmail(), account.getUsername());
            // 验证码存放到redis，15分钟过期
            RedisUtil.set(RedisCacheKeyConstant.EMAIL_CODE_PATH + account.getEmail(), code, RedisCacheKeyConstant.SECURITY_CODE_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException("发送失败！");
        }
        return code;
    }

    public String sendSecurityCodeToPhone(String number) {

        Account account = accountRepository.getByPhone(number);
        if (account == null) {
            throw new GlobalException("手机号不存在！");
        }
        String code;
        try {
            // String code = EmailUtils.sendSecurityCode(account.getEmail(), account.getRealName());
            code = "123456";
            // 验证码存放到redis，15分钟过期
            RedisUtil.set(RedisCacheKeyConstant.PHONE_CODE_PATH + account.getPhone(), code, RedisCacheKeyConstant.SECURITY_CODE_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException("发送失败！");
        }
        return code;
    }
}
