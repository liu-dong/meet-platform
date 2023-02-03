package com.dong.authserver.web.model;


import lombok.Data;

/**
 * @author LD 2021/5/18
 */
@Data
public class LoginDTO {

    private String username;
    private String password;
    private String captcha;//验证码
}
