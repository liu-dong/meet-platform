package com.dong.log.web.dao;

import com.dong.log.web.entity.OperateLogs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OperateLogsRepository extends JpaRepository<OperateLogs, String> {

    OperateLogs getById(String id);
}
