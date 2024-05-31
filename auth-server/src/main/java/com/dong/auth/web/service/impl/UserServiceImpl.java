package com.dong.auth.web.service.impl;

import cn.hutool.core.util.DesensitizedUtil;
import com.dong.auth.web.model.RegisterDTO;
import com.dong.auth.web.service.UserDetailFactory;
import com.dong.auth.web.service.UserDetailService;
import com.dong.auth.web.service.UserService;
import com.dong.commoncore.enums.UserTypeEnum;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.CommonUtils;
import com.dong.user.dao.AccountRepository;
import com.dong.user.dao.UserRoleRepository;
import com.dong.user.dao.PersonRepository;
import com.dong.user.dao.RoleRepository;
import com.dong.user.entity.Account;
import com.dong.user.entity.UserRole;
import com.dong.user.entity.Person;
import com.dong.user.service.AccountService;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author LD 2023/10/27
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    AccountRepository accountRepository;
    @Autowired
    PersonRepository personRepository;
    @Autowired
    AccountService accountService;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    UserRoleRepository userRoleRepository;

    @Autowired
    UserDetailFactory userDetailFactory;

    @Override
    public String register(RegisterDTO dto) {
        // 创建人员信息
        String personId = createPerson(dto);
        // 创建用户信息
        String userId = createUser(dto);
        // 创建账号
        Account account = saveAccount(dto, personId);
        // 新增用户时默认分配普通用户权限
        saveAccountRole(dto, account.getId());
        return account.getUsername();
    }

    private String createUser(RegisterDTO dto) {
    }

    @NotNull
    private Account saveAccount(RegisterDTO dto, String personId) {
        Account entity = new Account();
        String accountId = CommonUtils.getUUID();
        entity.setId(accountId);
        entity.setUsername(dto.getUsername());
        entity.setPassword(dto.getPassword());
        entity.setPasswordHash(DesensitizedUtil.password(dto.getPassword()));
        entity.setEmail(dto.getEmail());
        entity.setPhone(dto.getPhone());
        entity.setPersonId(personId);
        entity.setRealName(dto.getRealName());
        entity.setUserType(UserTypeEnum.USER.getCode());
        entity.setUserStatus(0);
        entity.setLoginCount(0);
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        accountRepository.save(entity);
        return entity;
    }

    private void saveAccountRole(RegisterDTO dto, String accountId) {
        UserRole userRole = new UserRole();
        userRole.setId(CommonUtils.getUUID());
        userRole.setUserId(accountId);
        String roleId = "32047ea768ff4c72a784e0bc02650eaa";
        if (dto.getUserType() != null) {
            // 根据用户类型获取角色id
            roleId = roleRepository.getByRoleName(UserTypeEnum.getNameByRole(dto.getUserType())).getId();
        }
        userRole.setRoleId(roleId);
        userRoleRepository.save(userRole);
    }

    /**
     * 创建人员信息
     * @param dto 
     * @return
     */
    private String createPerson(RegisterDTO dto) {
        Person person = new Person();
        person.setId(CommonUtils.getUUID());
        person.setName(dto.getRealName());
        person.setIdentityCard(dto.getIdentityCard());
        person.setCreateTime(new Date());
        personRepository.save(person);
        return person.getId();
    }

    @Override
    public void cancel(String username) {
        if (StringUtils.isEmpty(username)) {
            throw new GlobalException("用户名不能为空!");
        }

        Account user = accountRepository.getAccountByUsername(username);
        user.setUserStatus(1);// 注销
        user.setUpdateTime(new Date());
        accountRepository.save(user);
    }


    @Override
    public UserDetail getUserDetail(Account account) {
        UserDetail user = new UserDetail();
        if (account != null) {
            user.setUserId(account.getId());
            user.setUsername(account.getUsername());
            user.setRealName(account.getRealName());
            // 查询账号角色
            List<Map<String, Object>> roles = accountService.findAccountRoleInfoList(user.getUserId());
            user.setRoles(roles);
            // 查询账号权限
            List<Map<String, Object>> permissions = accountService.findAccountPermissionList(user.getUserId());
            user.setPermissions(permissions);
        }
        return user;
    }

    @Override
    public UserDetail getUserDetail(HttpServletRequest request) {
        UserDetailService userDetailService = userDetailFactory.createUserDetailService();
        return userDetailService.getUserDetail(request);
    }
}
