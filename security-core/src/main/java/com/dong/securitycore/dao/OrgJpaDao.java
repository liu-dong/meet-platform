package com.dong.securitycore.dao;

import com.dong.securitycore.entity.Org;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrgJpaDao extends JpaRepository<Org, String> {

}
