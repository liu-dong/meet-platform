package com.dong.auth.web.model;

import lombok.Data;

/**
 * 登录
 *
 * @author liudong 2024/4/20
 */
@Data
public class LoginDTO {

    /**
     * 验证码
     */
    private String captcha;

    /**
     * 登录方式
     */
    private String loginWay = "account";

    private String username;

    private String password;

    private String phone;

    private String email;
}
