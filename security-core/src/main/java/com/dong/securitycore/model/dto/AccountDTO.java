package com.dong.securitycore.model.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author LD
 * @date 2020/3/22 22:02
 */
@Data
public class AccountDTO {

    private String id;
    @NotNull(message = "用户名不能为空")
    private String username;
    @NotNull(message = "密码不能为空")
    private String password;
    private String userToken;//用户token
    private Integer userType;//用户类型 2：普通用户，默认为普通用户
    private String captcha;//验证码
    private String realName;//真实姓名
    private String identityCard;//身份证号
    private List<String> roleIdList;//角色id
    private String accountId;//角色id
}

