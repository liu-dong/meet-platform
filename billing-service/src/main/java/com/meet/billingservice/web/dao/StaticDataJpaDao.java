package com.meet.billingservice.web.dao;

import com.meet.billingservice.web.entity.StaticSpec;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author liudong 2022/6/11
 */
@Repository
public interface StaticDataJpaDao extends JpaRepository<StaticSpec, String> {
}
