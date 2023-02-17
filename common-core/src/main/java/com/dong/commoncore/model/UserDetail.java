package com.dong.commoncore.model;


import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @author LD 2021/5/18
 */
@Data
public class UserDetail {

    /**
     * 用户id
     */
    private String userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 单位id
     */
    private String orgId;

    /**
     * 单位名称
     */
    private String orgName;

    /**
     * 拥有角色
     */
    private List<Map<String, Object>> roles;

    /**
     * 拥有权限
     */
    private List<Map<String, Object>> permissions;


}
