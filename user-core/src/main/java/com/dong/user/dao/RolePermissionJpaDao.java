package com.dong.user.dao;

import com.dong.user.entity.RolePermission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RolePermissionJpaDao extends JpaRepository<RolePermission, String> {

    int deleteRolePermissionByRoleId(String roleId);

    List<RolePermission> findByRoleId(String roleId);

}
