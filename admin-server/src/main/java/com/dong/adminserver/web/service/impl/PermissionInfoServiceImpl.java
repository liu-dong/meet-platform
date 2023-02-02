package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.PermissionJpaDao;
import com.dong.adminserver.web.entity.Permission;
import com.dong.adminserver.web.model.dto.PermissionDTO;
import com.dong.adminserver.web.model.vo.PermissionVO;
import com.dong.adminserver.web.service.PermissionInfoService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class PermissionInfoServiceImpl implements PermissionInfoService {

    @Autowired
    PermissionJpaDao permissionJpaDao;
    @Autowired
    CommonDao commonDao;

    /**
     * 查询权限信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<PermissionVO> findPermissionInfoList(PermissionDTO dto, Pager<PermissionVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT id,permission_code permissionCode,permission_name permissionName,permission_type permissionType,create_time createTime ");
        sql.append(" FROM sys_permission ");
        sql.append(" WHERE 1=1 ");
        if (StringUtils.isNotBlank(dto.getPermissionCode())) {
            sql.append(" AND permission_code LIKE ? ");
            params.add("%" + dto.getPermissionCode().trim() + "%");
        }
        if (StringUtils.isNotBlank(dto.getPermissionName())) {
            sql.append(" AND permission_name LIKE ? ");
            params.add("%" + dto.getPermissionName().trim() + "%");
        }
        sql.append(" ORDER BY create_time DESC ");
        return commonDao.findListBySql(pager, sql, params, PermissionVO.class);
    }

    @Override
    public List<Map<String, Object>> getPermissionTree(PermissionDTO dto) {
        List<Permission> permissionList = permissionJpaDao.findAll();
        List<Map<String, Object>> listMap = new ArrayList<>();
        //实体类list转map对象list
        for (Permission permission : permissionList) {
            Map<String, Object> map = CommonUtils.objectToMap(permission);
            map.put("children", new ArrayList<>());
            listMap.add(map);
        }
        //递归生成树结构
        return CommonUtils.listToTreeByRecursive(listMap);
    }

    /**
     * 保存权限信息
     *
     * @param dto
     * @return
     */
    @Override
    public Permission savePermissionInfo(PermissionDTO dto) {
        Permission entity = new Permission();
        if (StringUtils.isEmpty(dto.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = permissionJpaDao.findById(dto.getId()).orElse(new Permission());
            entity.setUpdateTime(new Date());
        }
        entity.setPermissionCode(dto.getPermissionCode());
        entity.setPermissionName(dto.getPermissionName());
        entity.setPermissionType(dto.getPermissionType());
        entity.setParentId(dto.getParentId());
        entity.setResourceId(dto.getResourceId());
        entity.setUpdateTime(new Date());
        entity = permissionJpaDao.save(entity);
        return permissionJpaDao.save(entity);
    }

    /**
     * 查询权限信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public Permission getPermissionInfo(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("查询失败，id不能为空!");
        }
        return permissionJpaDao.findById(id).orElse(new Permission());
    }

    /**
     * 删除权限信息
     *
     * @param id
     */
    @Override
    public void deletePermissionInfo(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("删除失败，id不能为空!");
        }
        permissionJpaDao.deleteById(id);
    }

}
