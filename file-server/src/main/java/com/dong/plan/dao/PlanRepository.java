package com.dong.plan.dao;

import com.dong.plan.entity.Plan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author liudong
 * @date 2023/7/20
 */
@Repository
public interface PlanRepository extends JpaRepository<Plan, String> {
}
