package com.dong.sso.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @author liudong
 * @date 2023/10/20
 */
public class UserDetailsVO extends User {

    /**
     * 用户id
     */
    private String userId;

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

    public UserDetailsVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public UserDetailsVO(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }

    public UserDetailsVO(String username, String password, Collection<? extends GrantedAuthority> authorities, String id, String realName) {
        super(username, password, authorities);
        this.realName = realName;
        this.userId = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public List<Map<String, Object>> getRoles() {
        return roles;
    }

    public void setRoles(List<Map<String, Object>> roles) {
        this.roles = roles;
    }

    public List<Map<String, Object>> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Map<String, Object>> permissions) {
        this.permissions = permissions;
    }
}
