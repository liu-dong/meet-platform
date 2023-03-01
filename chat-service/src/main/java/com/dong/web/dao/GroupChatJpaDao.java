package com.dong.web.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupChatJpaDao extends JpaRepository<GroupChat, String> {

}