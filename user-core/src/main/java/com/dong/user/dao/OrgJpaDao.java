package com.dong.user.dao;

import com.dong.user.entity.Org;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrgJpaDao extends JpaRepository<Org, String> {

}
