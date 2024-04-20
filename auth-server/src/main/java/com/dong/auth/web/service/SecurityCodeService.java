package com.dong.auth.web.service;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.EmailUtils;
import com.dong.commoncore.util.RedisUtil;
import com.dong.user.dao.AccountRepository;
import com.dong.user.entity.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author liudong 2024/4/20
 */
public interface SecurityCodeService {

    void sendSecurityCode();
}

@Service
class PhoneSecurityCodeService implements  SecurityCodeService {

    @Override
    public void sendSecurityCode() {

    }
}

@Service
class EmailSecurityCodeService implements  SecurityCodeService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public void sendSecurityCode() {
       /*  Person person = personRepository.getPersonByEmail(email);
        if (person == null) {
            return ResponseResult.error("邮箱不存在！");
        }
        try {
            String code = EmailUtils.sendSecurityCode(person.getEmail(), person.getName());
            //验证码存放到redis，15分钟过期
            RedisUtil.set(CommonConstant.EMAIL_CODE_PATH + email, code, CommonConstant.SECURITY_CODE_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error("发送失败！");
        }
        return ResponseResult.success("验证码已发送！"); */
    }
}
