package com.meet.billingservice.web.dao;
import com.meet.billingservice.web.entity.Suishouji;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 账单明细
 *
 * @author zhang.jiaxin
 * @since 2022-05-28
 */
@Repository
public interface SsjJpaDao extends JpaRepository<Suishouji, String> {



}
