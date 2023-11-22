package com.dong.user.service.impl;

import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.enums.UserTypeEnum;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import com.dong.user.dao.AccountJpaDao;
import com.dong.user.dao.AccountRoleJpaDao;
import com.dong.user.dao.PersonJpaDao;
import com.dong.user.dao.RoleJpaDao;
import com.dong.user.entity.Account;
import com.dong.user.entity.AccountRole;
import com.dong.user.entity.Person;
import com.dong.user.model.dto.AccountDTO;
import com.dong.user.model.vo.AccountVO;
import com.dong.user.service.AccountService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author LD
 * @date 2020/10/12 13:01
 */
@Service
class AccountServiceImpl implements AccountService {

    @Autowired
    CommonDao commonDao;
    @Autowired
    AccountJpaDao accountJpaDao;
    @Autowired
    PersonJpaDao personJpaDao;
    @Autowired
    RoleJpaDao roleJpaDao;
    @Autowired
    AccountRoleJpaDao accountRoleJpaDao;

    @Override
    @Transactional
    public Account register(AccountDTO dto) {
        Account entity = new Account();
        if (StringUtils.isEmpty(dto.getId())) {//新增
            String accountId = CommonUtils.getUUID();
            //新增用户时保存一条人员信息
            Person person = new Person();
            person.setId(CommonUtils.getUUID());
            person.setName(dto.getRealName());
            person.setIdentityCard(dto.getIdentityCard());
            person.setCreateTime(new Date());
            String personId = personJpaDao.save(person).getId();
            //新增用户时默认分配普通用户权限
            AccountRole accountRole = new AccountRole();
            accountRole.setId(CommonUtils.getUUID());
            accountRole.setAccountId(accountId);
            String roleId = "32047ea768ff4c72a784e0bc02650eaa";
            if (dto.getUserType() != null) {
                //根据用户类型获取角色id
                roleId = roleJpaDao.getByRoleName(UserTypeEnum.getNameByRole(dto.getUserType())).getId();
            }
            accountRole.setRoleId(roleId);
            accountRoleJpaDao.save(accountRole);

            entity.setId(accountId);
            entity.setUsername(dto.getUsername());
            entity.setPassword(dto.getPassword());
            entity.setCreateTime(new Date());
            entity.setPersonId(personId);
        } else {
            entity = accountJpaDao.getById(dto.getId());
            //如果修改了名称并同时修改人员表的名称
            if (!StringUtils.isEmpty(dto.getRealName()) && !entity.getRealName().equals(dto.getRealName())) {
                Person person = personJpaDao.getById(entity.getPersonId());
                person.setName(dto.getRealName());
                personJpaDao.save(person);
            }
        }
        entity.setUserType(dto.getUserType());
        entity.setRealName(dto.getRealName());
        entity.setUpdateTime(new Date());
        return accountJpaDao.save(entity);
    }

    @Override
    public AccountVO login(String username, String password) {
        if (!StringUtils.isEmpty(username)) {
            throw new GlobalException("用户名不能为空!");
        }
        Account user = accountJpaDao.getAccountByUsername(username);
        if (user == null) {
            throw new GlobalException("无此用户！");
        }
        String lastLoginTime = "第一次登录";
        if (user.getLastLoginTime() != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
            lastLoginTime = sdf.format(user.getLastLoginTime());
        }
        if (!user.getPassword().equals(password)) {
            throw new GlobalException("密码错误!");
        }
        user.setLastLoginTime(new Date());
        user.setLoginCount(user.getLoginCount() + 1);
        Account account = accountJpaDao.save(user);
        return convertAccountVO(account, lastLoginTime);
    }

    private AccountVO convertAccountVO(Account account, String lastLoginTime) {
        AccountVO accountVO = new AccountVO();
        BeanUtils.copyProperties(account, accountVO);
        accountVO.setLastLoginTime(lastLoginTime);
        return accountVO;
    }

    @Override
    public ResponseResult logout(String username) {
        return ResponseResult.success("退出登录成功!");
    }

    @Override
    public String cancel(String username) {
        if (StringUtils.isEmpty(username)) {
            throw new GlobalException("用户名不能为空!");
        }
        Account user = accountJpaDao.getAccountByUsername(username);
        user.setUserStatus(1);//注销
        user.setUpdateTime(new Date());
        accountJpaDao.save(user);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        return "注销成功!注销时间：" + sdf.format(new Date());
    }

    @Override
    public Pager<AccountVO> findAccountList(AccountDTO dto, Pager<AccountVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id, username, user_type userType, person_id personId, real_name realName, ");
        sql.append(" user_status userStatus, last_login_time lastLoginTime, create_time createTime ");
        sql.append(" FROM sys_account ");
        sql.append(" WHERE 1=1 ");
        //用户名
        if (StringUtils.isNotBlank(dto.getUsername())) {
            sql.append(" AND username LIKE ? ");
            params.add(CommonUtils.jointLike(dto.getUsername()));
        }
        //用户类型
        if (dto.getUserType() != null) {
            sql.append(" AND user_type = ? ");
            params.add(dto.getUserType());
        }
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, AccountVO.class);
    }

    @Override
    public Account getAccount(String id) {
        if (StringUtils.isBlank(id)) {
            throw new GlobalException("id不能为空");
        }
        return accountJpaDao.getById(id);
    }

    @Override
    public void deleteAccount(String id) {
        if (!StringUtils.isEmpty(id)) {
            throw new GlobalException("删除失败，id不能为空!");
        }
        accountJpaDao.deleteById(id);
    }

    @Override
    public List<Map<String, Object>> findAccountRoleInfoList(String accountId) {
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT r.id,r.role_code roleCode,r.role_name roleName ");
        sql.append(" FROM sys_role r ");
        sql.append(" INNER JOIN sys_account_role ar ON ar.role_id = r.id ");
        sql.append(" INNER JOIN sys_account a ON a.id = ar.account_id ");
        sql.append(" WHERE a.id = ? ");
        if (StringUtils.isEmpty(accountId)) {
            throw new GlobalException("账号id不能为空！");
        }
        param.add(accountId);
        sql.append(" ORDER BY r.create_time DESC ");
        return commonDao.findListMapBySql(sql, param);
    }

    @Override
    public List<Map<String, Object>> findAccountPermissionList(String accountId) {
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT t1.id,t1.permission_code permissionCode,t1.permission_name permissionName,t1.permission_type permissionType ");
        sql.append(" FROM sys_permission t1 ");
        sql.append(" INNER JOIN sys_role_permission t2 ON t2.permission_id = t1.id ");
        sql.append(" INNER JOIN sys_account_role t3 ON t3.role_id = t2.role_id ");
        sql.append(" WHERE t3.account_id = ? ");
        if (StringUtils.isEmpty(accountId)) {
            throw new GlobalException("账号id不能为空！");
        }
        param.add(accountId);
        sql.append(" ORDER BY t1.create_time DESC ");
        return commonDao.findListMapBySql(sql, param);
    }

    @Transactional
    @Override
    public List<AccountRole> assignRoles(AccountDTO dto) {
        if (StringUtils.isEmpty(dto.getAccountId())) {
            throw new GlobalException("账号id不能为空");
        }
        accountRoleJpaDao.deleteAccountRoleByAccountId(dto.getAccountId());
        List<AccountRole> entityList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(dto.getRoleIdList())) {
            for (String roleId : dto.getRoleIdList()) {
                AccountRole entity = new AccountRole();
                entity.setId(CommonUtils.getUUID());
                entity.setAccountId(dto.getAccountId());
                entity.setRoleId(roleId);
                entityList.add(entity);
            }
            entityList = accountRoleJpaDao.saveAll(entityList);
        }
        return entityList;
    }

    @Override
    public Account getAccountByUsername(String username) {
        return accountJpaDao.getAccountByUsername(username);
    }

    @Override
    public String updateLastLoginTime(Account account) {
        String lastLoginTime = "第一次登录";
        if (account.getLastLoginTime() != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
            lastLoginTime = sdf.format(account.getLastLoginTime());
        }
        account.setLastLoginTime(new Date());
        account.setLoginCount(account.getLoginCount() + 1);
        accountJpaDao.save(account);
        return lastLoginTime;
    }
}
