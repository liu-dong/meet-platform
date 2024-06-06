package com.dong.admin.web.dao;

import com.dong.admin.web.entity.AdministrativeDivision;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdministrativeDivisionRepository extends JpaRepository<AdministrativeDivision, String> {

    List<AdministrativeDivision> findByDivisionType(int divisionType);

    List<AdministrativeDivision> findByParentCode(String divisionCode);


}
