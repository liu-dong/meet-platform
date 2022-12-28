package com.dong.adminserver.web.dao;


import com.dong.adminserver.web.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleJpaDao extends JpaRepository<Role, String> {

    Role getByRoleName(String roleName);

    /**
     * 根据账号id查询角色信息
     *
     * @param accountId
     * @return
     */
    @Query("from Role t1 " +
            "inner join AccountRole t2 on t2.roleId = t1.id " +
            "inner join Account t3 on t3.id = t2.accountId " +
            "where t3.id = ?1 ")
    List<Role> getByAccountId(String accountId);
}