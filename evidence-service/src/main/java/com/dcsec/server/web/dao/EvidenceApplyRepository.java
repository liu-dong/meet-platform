package com.dcsec.server.web.dao;

import com.dcsec.server.web.entity.EvidenceApply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EvidenceApplyRepository extends JpaRepository<EvidenceApply, String> {

}
