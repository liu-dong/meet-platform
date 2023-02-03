package com.dong.authserver.web.model;


import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @author LD 2021/5/18
 */
@Data
public class UserDetail {

    private String userId;
    private String username;
    private String accessToken;//用户token
    private String realName;//真实姓名
    private String orgId;
    private String orgName;
    private List<Map<String, Object>> roles;
    private List<Map<String, Object>> permissions;


}
