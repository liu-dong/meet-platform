package com.dong.event.web.dao;

import com.dong.event.web.entity.EventGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventGroupJpaDao extends JpaRepository<EventGroup, String> {

}