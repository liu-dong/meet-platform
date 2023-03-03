package com.dong.chat.web.dao;

import com.dong.chat.web.entity.GroupChat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupChatJpaDao extends JpaRepository<GroupChat, String> {

}