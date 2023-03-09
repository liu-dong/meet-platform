package com.dong.event.web.dao;

import com.dong.event.web.entity.Workflow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkflowJpaDao extends JpaRepository<Workflow, String> {

}