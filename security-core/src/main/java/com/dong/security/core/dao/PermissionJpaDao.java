package com.dong.security.core.dao;

import com.dong.security.core.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PermissionJpaDao extends JpaRepository<Permission, String> {

}
