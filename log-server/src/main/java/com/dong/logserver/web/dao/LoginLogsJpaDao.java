package com.dong.logserver.web.dao;

import com.dong.logserver.web.entity.LoginLogs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginLogsJpaDao extends JpaRepository<LoginLogs, String> {


}
