package com.dong.event.web.dao;

import com.dong.event.web.entity.WorkflowMainFlow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkflowMainFlowJpaDao extends JpaRepository<WorkflowMainFlow, String> {

}