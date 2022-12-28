package com.dong.adminserver.web.service.impl;

import com.dong.adminserver.web.dao.PermissionJpaDao;
import com.dong.adminserver.web.entity.Permission;
import com.dong.adminserver.web.model.PermissionInfoBean;
import com.dong.adminserver.web.service.PermissionInfoService;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class PermissionInfoServiceImpl implements PermissionInfoService {

    @Autowired
    PermissionJpaDao permissionJpaDao;

    /**
     * 查询权限信息列表
     *
     * @param bean
     * @param limit
     * @param page
     * @return
     */
    @Override
    public ResponseResult findPermissionInfoList(PermissionInfoBean bean, Integer limit, Integer page) {
        List<Permission> permissionList = permissionJpaDao.findAll();
        return ResponseResult.success(permissionList, "查询成功");
    }

    @Override
    public ResponseResult getPermissionTree(PermissionInfoBean bean) {
        List<Permission> permissionList = permissionJpaDao.findAll();
        List<Map<String, Object>> listMap = new ArrayList<>();
        //实体类list转map对象list
        for (Permission permission : permissionList) {
            Map<String, Object> map = CommonUtils.objectToMap(permission);
            map.put("children", new ArrayList<>());
            listMap.add(map);
        }
        //递归生成树结构
        List<Map<String, Object>> result = CommonUtils.listToTreeByRecursive(listMap);
        return ResponseResult.success(result, "查询成功");
    }

    /**
     * 保存权限信息
     *
     * @param bean
     * @return
     */
    @Override
    public ResponseResult savePermissionInfo(PermissionInfoBean bean) {
        Permission entity = new Permission();
        if (StringUtils.isEmpty(bean.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = permissionJpaDao.getOne(bean.getId());
            entity.setUpdateTime(new Date());
        }
        entity.setPermissionCode(bean.getPermissionCode());
        entity.setPermissionName(bean.getPermissionName());
        entity.setPermissionType(bean.getPermissionType());
        entity.setParentId(bean.getParentId());
        entity.setResourceId(bean.getResourceId());
        entity.setUpdateTime(new Date());
        entity = permissionJpaDao.save(entity);
        return ResponseResult.success(entity, "保存成功!");
    }

    /**
     * 查询权限信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult getPermissionInfo(String id) {
        if (StringUtils.isEmpty(id)) {
            return ResponseResult.error("查询失败，id不能为空!");
        } else {
            Permission entity = permissionJpaDao.getOne(id);
            return ResponseResult.success(entity, "查询成功!");
        }
    }

    /**
     * 删除权限信息
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult deletePermissionInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            permissionJpaDao.deleteById(id);
            return ResponseResult.success("删除成功!");
        }
        return ResponseResult.error("删除失败，id不能为空!");
    }

}
