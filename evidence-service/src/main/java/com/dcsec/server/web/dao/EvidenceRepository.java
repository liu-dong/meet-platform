package com.dcsec.server.web.dao;

import com.dcsec.server.web.entity.Evidence;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EvidenceRepository extends JpaRepository<Evidence, String> {

}
