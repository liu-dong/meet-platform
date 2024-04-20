package com.dong.auth.web.model;


import lombok.Data;

/**
 * 手机号登录
 *
 * @author LD 2021/5/18
 */
@Data
public class PhoneLoginDTO extends LoginDTO {
    private String phone;
}
