package com.dong.chat.web.dao;

import com.dong.chat.web.entity.GroupMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupMemberJpaDao extends JpaRepository<GroupMember, String> {

}