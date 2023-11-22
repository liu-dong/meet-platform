package com.dong.sso.service;

import com.dong.sso.model.UserDetailsVO;
import com.dong.user.dao.RoleJpaDao;
import com.dong.user.entity.Account;
import com.dong.user.entity.Role;
import com.dong.user.service.AccountService;
import com.dong.user.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liudong
 * @date 2023/10/20
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    RoleJpaDao roleJpaDao;
    @Autowired
    AccountService accountService;
    @Autowired
    PermissionService permissionService;

    @Override
    public UserDetailsVO loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountService.getAccountByUsername(username);
        List<Role> roleList = roleJpaDao.getByAccountId(account.getId());
        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();
        for (Role role : roleList) {
            authorityList.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        return new UserDetailsVO(account.getUsername(), account.getPassword(), authorityList, account.getId(), account.getRealName());
    }
}
