package com.dong.auth.web.service;

/**
 * 验证码
 *
 * @author liudong 2024/4/20
 */
public interface SecurityCodeService {

    String sendSecurityCode(String number);
}
