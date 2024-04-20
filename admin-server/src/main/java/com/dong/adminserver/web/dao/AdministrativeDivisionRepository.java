package com.dong.adminserver.web.dao;

import com.dong.adminserver.web.entity.AdministrativeDivision;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdministrativeDivisionRepository extends JpaRepository<AdministrativeDivision, String> {

    List<AdministrativeDivision> findByDivisionType(int divisionType);

    List<AdministrativeDivision> findByParentCode(String divisionCode);


}
