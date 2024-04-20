package com.dong.auth.web.model;


import lombok.Data;

/**
 * 邮箱登录
 *
 * @author LD 2021/5/18
 */
@Data
public class EmailLoginDTO extends LoginDTO {
    private String email;
}
