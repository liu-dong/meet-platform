package com.dong.auth.web.model;


import lombok.Data;

/**
 * 用户名登录
 *
 * @author LD 2021/5/18
 */
@Data
public class UsernameLoginDTO extends LoginDTO {
    private String username;
    private String password;
}
