package com.dong.event.web.dao;

import com.dong.event.web.entity.WorkflowFlowDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkflowFlowDetailRepository extends JpaRepository<WorkflowFlowDetail, String> {

    List<WorkflowFlowDetail> findByWorkflowId(String workflowId);
}
