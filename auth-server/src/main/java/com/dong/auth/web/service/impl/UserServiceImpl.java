package com.dong.auth.web.service.impl;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.model.RegisterDTO;
import com.dong.auth.web.service.UserService;
import com.dong.commoncore.enums.UserTypeEnum;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.dao.AccountRepository;
import com.dong.user.dao.AccountRoleRepository;
import com.dong.user.dao.PersonRepository;
import com.dong.user.dao.RoleRepository;
import com.dong.user.entity.Account;
import com.dong.user.entity.AccountRole;
import com.dong.user.entity.Person;
import com.dong.user.service.AccountService;
import io.jsonwebtoken.Claims;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
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
    AccountRoleRepository accountRoleRepository;


    @Override
    public Account getAccount(LoginDTO dto) {
        if (StringUtils.isBlank(dto.getUsername())) {
            throw new GlobalException("用户名为空");
        }
        if (StringUtils.isBlank(dto.getPassword())) {
            throw new GlobalException("密码为空");
        }
        Account account = accountRepository.getAccountByUsername(dto.getUsername());
        if (account == null) {
            throw new GlobalException("无此用户");
        }
        if (!dto.getPassword().equals(account.getPassword())) {
            throw new GlobalException("密码错误");
        }
        return account;
    }

    @Override
    public Account getAccountByUsername(String username) {
        return accountRepository.getAccountByUsername(username);
    }

    @Override
    public String register(RegisterDTO dto) {
        //新增用户时初始化一条人员信息
        String personId = initPerson(dto);
        //保存账号
        Account account = saveAccount(dto, personId);
        //新增用户时默认分配普通用户权限
        saveAccountRole(dto, account.getId());
        return account.getUsername();
    }

    @NotNull
    private Account saveAccount(RegisterDTO dto, String personId) {
        Account entity = new Account();
        String accountId = CommonUtils.getUUID();
        entity.setId(accountId);
        entity.setUsername(dto.getUsername());
        entity.setPassword(dto.getPassword());
        entity.setCreateTime(new Date());
        entity.setPersonId(personId);
        entity.setUserType(dto.getUserType());
        entity.setRealName(dto.getRealName());
        entity.setUpdateTime(new Date());
        accountRepository.save(entity);
        return entity;
    }

    private void saveAccountRole(RegisterDTO dto, String accountId) {
        AccountRole accountRole = new AccountRole();
        accountRole.setId(CommonUtils.getUUID());
        accountRole.setAccountId(accountId);
        String roleId = "32047ea768ff4c72a784e0bc02650eaa";
        if (dto.getUserType() != null) {
            //根据用户类型获取角色id
            roleId = roleRepository.getByRoleName(UserTypeEnum.getNameByRole(dto.getUserType())).getId();
        }
        accountRole.setRoleId(roleId);
        accountRoleRepository.save(accountRole);
    }

    private String initPerson(RegisterDTO dto) {
        Person person = new Person();
        person.setId(CommonUtils.getUUID());
        person.setName(dto.getRealName());
        person.setIdentityCard(dto.getIdentityCard());
        person.setCreateTime(new Date());
        personRepository.save(person);
        return person.getId();
    }

    @Override
    public ResponseResult cancel(String username) {
        if (!StringUtils.isEmpty(username)) {
            Account user = accountRepository.getAccountByUsername(username);
            user.setUserStatus(1);//注销
            user.setUpdateTime(new Date());
            accountRepository.save(user);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
            return ResponseResult.success("注销成功!注销时间：" + sdf.format(new Date()));
        }
        return ResponseResult.success("用户名不能为空!");
    }


    @Override
    public UserDetail getUserDetail(Account account) {
        UserDetail user = new UserDetail();
        if (account != null) {
            user.setUserId(account.getId());
            user.setUsername(account.getUsername());
            user.setRealName(account.getRealName());
            //查询账号角色
            List<Map<String, Object>> roles = accountService.findAccountRoleInfoList(user.getUserId());
            user.setRoles(roles);
            //查询账号权限
            List<Map<String, Object>> permissions = accountService.findAccountPermissionList(user.getUserId());
            user.setPermissions(permissions);
        }
        return user;
    }
}
