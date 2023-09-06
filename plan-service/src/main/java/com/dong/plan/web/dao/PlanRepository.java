package com.dong.plan.web.dao;

import com.dong.plan.web.entity.Plan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface PlanRepository extends JpaRepository<Plan, String> {

    @Transactional
    @Modifying
    @Query(value = "UPDATE plan SET delete_status = 1 WHERE id=:id", nativeQuery = true)
    void logicDelete(String id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE plan SET delete_status = 1 WHERE id in (:ids)", nativeQuery = true)
    void batchLogicDelete(List<String> ids);
}
