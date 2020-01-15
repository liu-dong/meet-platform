package com.dong.meet.admin.security;

import org.springframework.security.core.GrantedAuthority;

/**
 * 权限封装实现类
 *
 * @author 3hld
 * @date 2020/1/15 11:36
 */
public class GrantedAuthorityImpl  implements GrantedAuthority {

    private static final long serialVersionUID = 1L;

    private String authority;

    public GrantedAuthorityImpl(String authority) {
        this.authority = authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public String getAuthority() {
        return this.authority;
    }
}
