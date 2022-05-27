package com.dong.billingservice.web.dao;
import com.dong.billingservice.web.entity.BillingDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BillingDetailsJpaDao extends JpaRepository<BillingDetails, String> {

}
