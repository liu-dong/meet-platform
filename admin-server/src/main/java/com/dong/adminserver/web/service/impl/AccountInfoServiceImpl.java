package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.AccountJpaDao;
import com.dong.adminserver.web.dao.AccountRoleJpaDao;
import com.dong.adminserver.web.dao.PersonJpaDao;
import com.dong.adminserver.web.dao.RoleJpaDao;
import com.dong.adminserver.web.entity.Account;
import com.dong.adminserver.web.entity.AccountRole;
import com.dong.adminserver.web.entity.Person;
import com.dong.adminserver.web.model.AccountInfoBean;
import com.dong.adminserver.web.service.AccountInfoService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.enums.UserTypeEnum;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

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
public class AccountInfoServiceImpl implements AccountInfoService {

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
    public ResponseResult register(AccountInfoBean bean) {
        Account entity = new Account();
        if (StringUtils.isEmpty(bean.getId())) {//新增
            String accountId = CommonUtils.getUUID();
            //新增用户时保存一条人员信息
            Person person = new Person();
            person.setId(CommonUtils.getUUID());
            person.setName(bean.getRealName());
            person.setIdentityCard(bean.getIdentityCard());
            person.setCreateTime(new Date());
            String personId = personJpaDao.save(person).getId();
            //新增用户时默认分配普通用户权限
            AccountRole accountRole = new AccountRole();
            accountRole.setId(CommonUtils.getUUID());
            accountRole.setAccountId(accountId);
            String roleId = "32047ea768ff4c72a784e0bc02650eaa";
            if (!StringUtils.isEmpty(bean.getUserType())) {
                //根据用户类型获取角色id
                roleId = roleJpaDao.getByRoleName(UserTypeEnum.getNameByRole(bean.getUserType())).getId();
            }
            accountRole.setRoleId(roleId);
            accountRoleJpaDao.save(accountRole);

            entity.setId(accountId);
            entity.setUsername(bean.getUsername());
            entity.setPassword(bean.getPassword());
            entity.setCreateTime(new Date());
            entity.setPersonId(personId);
        } else {
            entity = accountJpaDao.getOne(bean.getId());
            //如果修改了名称并同时修改人员表的名称
            if (!StringUtils.isEmpty(bean.getRealName()) && !entity.getRealName().equals(bean.getRealName())) {
                Person person = personJpaDao.getOne(entity.getPersonId());
                person.setName(bean.getRealName());
                personJpaDao.save(person);
            }
        }
        entity.setUserType(bean.getUserType());
        entity.setRealName(bean.getRealName());
        entity.setUpdateTime(new Date());
        entity = accountJpaDao.save(entity);
        return ResponseResult.success(entity, "注册成功!");
    }

    @Override
    public ResponseResult login(String username, String password) {
        if (!StringUtils.isEmpty(username)) {
            Account user = accountJpaDao.getAccountByUsername(username);
            if (user == null) {
                return ResponseResult.error("无此用户！");
            }
            String lastLoginTime = "第一次登录";
            if (!StringUtils.isEmpty(user.getLastLoginTime())) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
                lastLoginTime = sdf.format(user.getLastLoginTime());
            }
            if (user.getPassword().equals(password)) {
                user.setLastLoginTime(new Date());
                user.setLoginCount(user.getLoginCount() + 1);
                accountJpaDao.save(user);
            }
            return ResponseResult.success(user, "登录成功!上次登录时间：" + lastLoginTime);
        }
        return ResponseResult.error("用户名不能为空!");
    }

    @Override
    public ResponseResult logout(String username) {
        return ResponseResult.success("退出登录成功!");
    }

    @Override
    public ResponseResult cancel(String username) {
        if (!StringUtils.isEmpty(username)) {
            Account user = accountJpaDao.getAccountByUsername(username);
            user.setUserStatus(1);//注销
            user.setUpdateTime(new Date());
            accountJpaDao.save(user);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
            return ResponseResult.success("注销成功!注销时间：" + sdf.format(new Date()));
        }
        return ResponseResult.success("用户名不能为空!");
    }

    @Override
    public ResponseResult findAccountInfoList(AccountInfoBean bean, Integer limit, Integer page) {
        List<Account> userList = accountJpaDao.findAll();
        return ResponseResult.success(userList, "查询成功");
    }

    @Override
    public ResponseResult getAccountInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            Account entity = accountJpaDao.getOne(id);
            return ResponseResult.success(entity, "查询成功!");
        }
        return ResponseResult.error("查询失败，id不能为空!");
    }

    @Override
    public ResponseResult deleteAccountInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            accountJpaDao.deleteById(id);
            return ResponseResult.success("删除成功!");
        }
        return ResponseResult.error("删除失败，id不能为空!");
    }

    @Override
    public ResponseResult findAccountRoleInfoList(AccountInfoBean bean) {
        ResponseResult result = new ResponseResult();
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT r.id,r.role_code roleCode,r.role_name roleName ");
        sql.append(" FROM role r ");
        sql.append(" INNER JOIN account_role ar ON ar.role_id = r.id ");
        sql.append(" INNER JOIN account a ON a.id = ar.account_id ");
        sql.append(" WHERE a.id = ? ");
        if (StringUtils.isEmpty(bean.getAccountId())) {
            return ResponseResult.error("账号id不能为空！");
        }
        param.add(bean.getAccountId());
        sql.append(" ORDER BY r.create_time DESC ");
        int total = commonDao.getTotalBySql(sql, param);
        if (total > 0) {
            List<Map<String, Object>> dataList = commonDao.findListMapBySql(sql, param);
            result.setData(dataList);
            result.setMessage("查询成功！");
        }
        return result;
    }

    @Transactional
    @Override
    public ResponseResult assignRoles(AccountInfoBean bean) {
        if (StringUtils.isEmpty(bean.getAccountId())) {
            return ResponseResult.error("账号id不能为空");
        }
        accountRoleJpaDao.deleteAccountRoleByAccountId(bean.getAccountId());
        List<AccountRole> entityList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(bean.getRoleIdList())) {
            for (String roleId : bean.getRoleIdList()) {
                AccountRole entity = new AccountRole();
                entity.setId(CommonUtils.getUUID());
                entity.setAccountId(bean.getAccountId());
                entity.setRoleId(roleId);
                entityList.add(entity);
            }
            entityList = accountRoleJpaDao.saveAll(entityList);
        }
        return ResponseResult.success(entityList, "分配成功!");
    }
}
