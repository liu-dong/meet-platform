package com.dong.event.web.dao;

import com.dong.event.web.entity.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventJpaDao extends JpaRepository<Event, String> {

}