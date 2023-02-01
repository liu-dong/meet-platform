package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.AccountRoleJpaDao;
import com.dong.adminserver.web.dao.RoleJpaDao;
import com.dong.adminserver.web.dao.RolePermissionJpaDao;
import com.dong.adminserver.web.entity.AccountRole;
import com.dong.adminserver.web.entity.Role;
import com.dong.adminserver.web.entity.RolePermission;
import com.dong.adminserver.web.model.dto.RoleDTO;
import com.dong.adminserver.web.model.vo.RoleVO;
import com.dong.adminserver.web.service.RoleService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {

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
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<RoleVO> findRoleList(RoleDTO dto, Pager<RoleVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,role_code roleCode,role_name roleName,remark,create_time createTime ");
        sql.append(" FROM sys_role ");
        sql.append(" WHERE 1=1 ");
        if (StringUtils.isNotBlank(dto.getRoleName())) {
            sql.append(" AND role_name LIKE ? ");
            params.add("%" + dto.getRoleName().trim() + "%");
        }
        if (StringUtils.isNotBlank(dto.getRoleCode())) {
            sql.append(" AND role_code LIKE ? ");
            params.add("%" + dto.getRoleCode().trim() + "%");
        }
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, RoleVO.class);
    }

    /**
     * 保存角色信息
     *
     * @param dto
     * @return
     */
    @Override
    public ResponseResult saveRole(RoleDTO dto) {
        Role entity = new Role();
        if (StringUtils.isBlank(dto.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = roleJpaDao.getById(dto.getId());
        }
        entity.setRoleName(dto.getRoleName());
        entity.setRemark(dto.getRemark());
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
    public Role getRoleDetail(String id) {
        if (StringUtils.isBlank(id)) {
            throw new GlobalException("id不能为空");
        }
        return roleJpaDao.getById(id);
    }

    /**
     * 删除角色信息
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult deleteRole(String id) {
        if (!StringUtils.isBlank(id)) {
            roleJpaDao.deleteById(id);
            return ResponseResult.success("删除成功!");
        }
        return ResponseResult.error("删除失败，id不能为空!");
    }

    @Override
    public ResponseResult findRoleAccountList(RoleDTO dto) {
        ResponseResult result = new ResponseResult();
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT a.id,a.username,a.real_name realName,a.user_type userType ");
        sql.append(" FROM account a ");
        sql.append(" INNER JOIN account_role ar ON ar.account_id = a.id ");
        sql.append(" INNER JOIN role r ON r.id = ar.role_id ");
        sql.append(" WHERE r.role_code = ? ");
        if (StringUtils.isBlank(dto.getRoleCode())) {
            return ResponseResult.error("角色编码不能为空！");
        }
        param.add(dto.getRoleCode());
        sql.append(" ORDER BY a.create_time DESC ");
        int total = commonDao.getTotalBySql(sql, param);
        if (total > 0) {
            List<Map<String, Object>> dataList = commonDao.findListBySql(sql, param);
            result.setData(dataList);

            result.setMessage("查询成功！");
        }

        return result;
    }

    @Override
    public ResponseResult findRolePermissionList(RoleDTO dto) {
        RoleDTO result = new RoleDTO();
        //根据角色id查询出所有权限
        List<RolePermission> rolePermissionList = rolePermissionJpaDao.findByRoleId(dto.getRoleId());
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
    public ResponseResult assignAccounts(RoleDTO dto) {
        if (StringUtils.isBlank(dto.getRoleId())) {
            return ResponseResult.error("角色id不能为空");
        }
        accountRoleJpaDao.deleteAccountRoleByRoleId(dto.getRoleId());
        List<AccountRole> entityList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(dto.getAccountIdList())) {
            for (String accountId : dto.getAccountIdList()) {
                AccountRole entity = new AccountRole();
                entity.setId(CommonUtils.getUUID());
                entity.setAccountId(accountId);
                entity.setRoleId(dto.getRoleId());
                entityList.add(entity);
            }
            entityList = accountRoleJpaDao.saveAll(entityList);
        }
        return ResponseResult.success(entityList, "分配成功!");
    }

    @Transactional
    @Override
    public ResponseResult assignPermissions(RoleDTO dto) {
        if (StringUtils.isBlank(dto.getRoleId())) {
            return ResponseResult.error("角色id不能为空");
        }
        rolePermissionJpaDao.deleteRolePermissionByRoleId(dto.getRoleId());
        List<RolePermission> entityList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(dto.getPermissionIdList())) {
            for (String permission : dto.getPermissionIdList()) {
                RolePermission entity = new RolePermission();
                entity.setId(CommonUtils.getUUID());
                entity.setPermissionId(permission);
                entity.setRoleId(dto.getRoleId());
                entityList.add(entity);
            }
            entityList = rolePermissionJpaDao.saveAll(entityList);
        }
        return ResponseResult.success(entityList.get(0).getRoleId(), "分配成功!");
    }
}
