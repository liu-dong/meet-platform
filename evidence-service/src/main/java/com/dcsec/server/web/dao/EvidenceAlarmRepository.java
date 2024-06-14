package com.dcsec.server.web.dao;

import com.dcsec.server.web.entity.EvidenceAlarm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EvidenceAlarmRepository extends JpaRepository<EvidenceAlarm, String> {

}
