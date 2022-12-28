package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.AccountRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRoleJpaDao extends JpaRepository<AccountRole, String> {

    int deleteAccountRoleByRoleId(String roleId);

    int deleteAccountRoleByAccountId(String accountId);

}
