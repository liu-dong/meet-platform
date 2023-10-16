package com.dong.security.core.dao;

import com.dong.security.core.entity.Org;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrgJpaDao extends JpaRepository<Org, String> {

}
