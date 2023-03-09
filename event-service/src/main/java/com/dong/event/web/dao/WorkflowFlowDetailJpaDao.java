package com.dong.event.web.dao;

import com.dong.event.web.entity.WorkflowFlowDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkflowFlowDetailJpaDao extends JpaRepository<WorkflowFlowDetail, String> {

}