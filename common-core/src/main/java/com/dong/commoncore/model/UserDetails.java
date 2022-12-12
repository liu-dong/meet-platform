package com.dong.commoncore.model;

import lombok.Data;

import java.util.List;

/**
 * @author liudong 2022/2/11
 */
@Data
public class UserDetails {

    private String userId;
    private String username;
    private String personId;
    private String realName;
    private String orgId;
    private String orgName;
    private List<String> roles;
}
