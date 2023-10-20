package com.dong.security.core.service;

import com.dong.security.core.dao.RoleJpaDao;
import com.dong.security.core.entity.Account;
import com.dong.security.core.entity.Role;
import com.dong.security.core.model.vo.UserDetailsVO;
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
    AccountService accountService;
    @Autowired
    RoleJpaDao roleJpaDao;
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
