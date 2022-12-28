package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.Org;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrgJpaDao extends JpaRepository<Org, String> {

}
