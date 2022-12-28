package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PermissionJpaDao extends JpaRepository<Permission, String> {

}
