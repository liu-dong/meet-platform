package com.dong.shardingspheredemo.web.dao;

import com.dong.shardingspheredemo.web.entity.BillingDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 账单明细
 *
 * @author zhang.jiaxin
 * @since 2022-05-28
 */
@Repository
public interface BillingDetailsJpaDao extends JpaRepository<BillingDetails, String> {

    @Query(value = "SELECT * FROM billing_details WHERE record_time LIKE :date", nativeQuery = true)
    List<BillingDetails> findByRecordTimeStartingWith(String date);

}
