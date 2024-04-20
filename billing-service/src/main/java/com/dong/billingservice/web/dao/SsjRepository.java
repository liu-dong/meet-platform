package com.dong.billingservice.web.dao;
import com.dong.billingservice.web.entity.Suishouji;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 账单明细
 *
 * @author zhang.jiaxin
 * @since 2022-05-28
 */
@Repository
public interface SsjRepository extends JpaRepository<Suishouji, String> {



}
