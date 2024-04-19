package com.dong.oauth2.exception;

import org.springframework.security.core.AuthenticationException;


/**
 * 验证码异常类
 *
 * @author LD 2021/5/28
 */
public class VerificationCodeException extends AuthenticationException {

    public VerificationCodeException() {
        super("验证码校验失败");
    }
}
