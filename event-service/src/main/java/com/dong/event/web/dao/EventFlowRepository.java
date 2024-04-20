package com.dong.event.web.dao;

import com.dong.event.web.entity.EventFlow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventFlowRepository extends JpaRepository<EventFlow, String> {

}
