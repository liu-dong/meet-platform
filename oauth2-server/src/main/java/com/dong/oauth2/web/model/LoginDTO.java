package com.dong.oauth2.web.model;


import lombok.Data;

/**
 * 登录
 *
 * @author LD 2021/5/18
 */
@Data
public class LoginDTO {
    private String username;
    private String password;
    private String captcha;//验证码
}
