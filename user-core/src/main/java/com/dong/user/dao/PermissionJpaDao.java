package com.dong.user.dao;

import com.dong.user.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PermissionJpaDao extends JpaRepository<Permission, String> {

}
