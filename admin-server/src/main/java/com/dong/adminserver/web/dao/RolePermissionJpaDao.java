package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.RolePermission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RolePermissionJpaDao extends JpaRepository<RolePermission, String> {

    int deleteRolePermissionByRoleId(String roleId);

    List<RolePermission> findByRoleId(String roleId);

}
