package com.dong.log.web.dao;

import com.dong.log.web.entity.LoginLogs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginLogsJpaDao extends JpaRepository<LoginLogs, String> {

    LoginLogs getById(String id);
}
