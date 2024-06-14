package com.dcsec.server.web.dao;

import com.dcsec.server.web.entity.EvidenceLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EvidenceLogRepository extends JpaRepository<EvidenceLog, String> {

}
