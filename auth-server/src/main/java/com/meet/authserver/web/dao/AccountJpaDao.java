package com.meet.authserver.web.dao;

import com.meet.authserver.web.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountJpaDao extends JpaRepository<Account, String> {

    Account getAccountByUsername(String username);

}
