package com.dong.adminserver.web.model.vo;

import lombok.Data;

/**
 * @author LD
 * @date 2020/3/22 22:02
 */
@Data
public class AccountVO {

    private String id;
    private String username;
    private String personId;
    private Integer userType;//用户类型 2：普通用户，默认为普通用户
    private Integer userStatus;//用户类型 2：普通用户，默认为普通用户
    private String realName;//真实姓名
    private String lastLoginTime;//上次登录时间
    private String createTime;//账号id
}

