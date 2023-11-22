package com.dong.user.dao;

import com.dong.user.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountJpaDao extends JpaRepository<Account, String> {

    Account getById(String id);

    Account getAccountByUsername(String username);

    Account getAccountByPersonId(String personId);

}