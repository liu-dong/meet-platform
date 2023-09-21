package com.dong.authserver.web.model;


import lombok.Data;

/**
 * 注册用户
 */
@Data
public class RegisterDTO {
    private String username;
    private String password;
    private String realName;
    private String identityCard;
    private Integer userType;
}
