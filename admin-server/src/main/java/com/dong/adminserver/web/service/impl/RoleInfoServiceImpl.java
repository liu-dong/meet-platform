package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.AccountRoleJpaDao;
import com.dong.adminserver.web.dao.RoleJpaDao;
import com.dong.adminserver.web.dao.RolePermissionJpaDao;
import com.dong.adminserver.web.entity.AccountRole;
import com.dong.adminserver.web.entity.Role;
import com.dong.adminserver.web.entity.RolePermission;
import com.dong.adminserver.web.model.RoleInfoBean;
import com.dong.adminserver.web.service.RoleInfoService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class RoleInfoServiceImpl implements RoleInfoService {

    @Autowired
    RoleJpaDao roleJpaDao;
    @Autowired
    AccountRoleJpaDao accountRoleJpaDao;
    @Autowired
    RolePermissionJpaDao rolePermissionJpaDao;

    @Autowired
    CommonDao commonDao;

    /**
     * 查询角色信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @Override
    public ResponseResult findRoleInfoList(RoleInfoBean bean, Integer limit, Integer page) {
        List<Role> roleList = roleJpaDao.findAll();
        return ResponseResult.success(roleList, "查询成功");
    }

    /**
     * 保存角色信息
     *
     * @param bean
     * @return
     */
    @Override
    public ResponseResult saveRoleInfo(RoleInfoBean bean) {
        Role entity = new Role();
        if (StringUtils.isEmpty(bean.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = roleJpaDao.getOne(bean.getId());
        }
        entity.setRoleName(bean.getRoleName());
        entity.setRemark(bean.getRemark());
        entity.setUpdateTime(new Date());
        entity = roleJpaDao.save(entity);
        return ResponseResult.success(entity, "保存成功!");
    }

    /**
     * 查询角色信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult getRoleInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            Role entity = roleJpaDao.getOne(id);
            return ResponseResult.success(entity, "查询成功!");
        }
        return ResponseResult.error("查询失败，id不能为空!");
    }

    /**
     * 删除角色信息
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult deleteRoleInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            roleJpaDao.deleteById(id);
            return ResponseResult.success("删除成功!");
        }
        return ResponseResult.error("删除失败，id不能为空!");
    }

    @Override
    public ResponseResult findRoleAccountInfoList(RoleInfoBean bean) {
        ResponseResult result = new ResponseResult();
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT a.id,a.username,a.real_name realName,a.user_type userType ");
        sql.append(" FROM account a ");
        sql.append(" INNER JOIN account_role ar ON ar.account_id = a.id ");
        sql.append(" INNER JOIN role r ON r.id = ar.role_id ");
        sql.append(" WHERE r.role_code = ? ");
        if (StringUtils.isEmpty(bean.getRoleCode())) {
            return ResponseResult.error("角色编码不能为空！");
        }
        param.add(bean.getRoleCode());
        sql.append(" ORDER BY a.create_time DESC ");
        int total = commonDao.getTotalBySql(sql, param);
        if (total > 0) {
            List<Map<String, Object>> dataList = commonDao.findListBySql(sql, param);
            result.setData(dataList);
            result.setTotal(dataList.size());
            result.setMessage("查询成功！");
        }
        result.setTotal(total);
        return result;
    }

    @Override
    public ResponseResult findRolePermissionInfoList(RoleInfoBean bean) {
        RoleInfoBean result = new RoleInfoBean();
        //根据角色id查询出所有权限
        List<RolePermission> rolePermissionList = rolePermissionJpaDao.findByRoleId(bean.getRoleId());
        List<String> permissionIdList = new ArrayList<>();
        //查询权限id集合
        for (RolePermission rolePermission : rolePermissionList) {
            permissionIdList.add(rolePermission.getPermissionId());
        }
        result.setRoleId(rolePermissionList.get(0).getRoleId());
        result.setPermissionIdList(permissionIdList);
        return ResponseResult.success(result, "查询成功！");
    }

    @Transactional
    @Override
    public ResponseResult assignAccounts(RoleInfoBean bean) {
        if (StringUtils.isEmpty(bean.getRoleId())) {
            return ResponseResult.error("角色id不能为空");
        }
        accountRoleJpaDao.deleteAccountRoleByRoleId(bean.getRoleId());
        List<AccountRole> entityList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(bean.getAccountIdList())) {
            for (String accountId : bean.getAccountIdList()) {
                AccountRole entity = new AccountRole();
                entity.setId(CommonUtils.getUUID());
                entity.setAccountId(accountId);
                entity.setRoleId(bean.getRoleId());
                entityList.add(entity);
            }
            entityList = accountRoleJpaDao.saveAll(entityList);
        }
        return ResponseResult.success(entityList, "分配成功!");
    }

    @Transactional
    @Override
    public ResponseResult assignPermissions(RoleInfoBean bean) {
        if (StringUtils.isEmpty(bean.getRoleId())) {
            return ResponseResult.error("角色id不能为空");
        }
        rolePermissionJpaDao.deleteRolePermissionByRoleId(bean.getRoleId());
        List<RolePermission> entityList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(bean.getPermissionIdList())) {
            for (String permission : bean.getPermissionIdList()) {
                RolePermission entity = new RolePermission();
                entity.setId(CommonUtils.getUUID());
                entity.setPermissionId(permission);
                entity.setRoleId(bean.getRoleId());
                entityList.add(entity);
            }
            entityList = rolePermissionJpaDao.saveAll(entityList);
        }
        return ResponseResult.success(entityList.get(0).getRoleId(), "分配成功!");
    }
}
