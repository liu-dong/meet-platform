package com.dong.securitycore.dao;

import com.dong.securitycore.entity.RolePermission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RolePermissionJpaDao extends JpaRepository<RolePermission, String> {

    int deleteRolePermissionByRoleId(String roleId);

    List<RolePermission> findByRoleId(String roleId);

}
