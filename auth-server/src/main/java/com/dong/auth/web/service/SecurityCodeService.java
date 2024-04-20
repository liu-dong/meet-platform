package com.dong.auth.web.service;

import com.dong.commoncore.constant.RedisCacheKeyConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.util.EmailUtils;
import com.dong.commoncore.util.RedisUtil;
import com.dong.user.dao.AccountRepository;
import com.dong.user.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 发送验证验证码
 *
 * @author liudong 2024/4/20
 */
public interface SecurityCodeService {

    void sendSecurityCode(String number);
}

@Service
class PhoneSecurityCodeServiceImpl implements  SecurityCodeService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public void sendSecurityCode(String number) {

        Account account = accountRepository.getByPhone(number);
        if (account == null) {
            throw new GlobalException("手机号不存在！");
        }
        try {
            // String code = EmailUtils.sendSecurityCode(account.getEmail(), account.getRealName());
            String code = "123456";
            //验证码存放到redis，15分钟过期
            RedisUtil.set(RedisCacheKeyConstant.PHONE_CODE_PATH + account.getPhone(), code, RedisCacheKeyConstant.SECURITY_CODE_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException("发送失败！");
        }
    }
}

@Service
class EmailSecurityCodeServiceImpl implements  SecurityCodeService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public void sendSecurityCode(String number) {
        Account account = accountRepository.getByEmail(number);
        if (account == null) {
            throw new GlobalException("邮箱不存在！");
        }
        try {
            String code = EmailUtils.sendSecurityCode(account.getEmail(), account.getRealName());
            //验证码存放到redis，15分钟过期
            RedisUtil.set(RedisCacheKeyConstant.EMAIL_CODE_PATH + account.getEmail(), code, RedisCacheKeyConstant.SECURITY_CODE_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException("发送失败！");
        }
    }
}
