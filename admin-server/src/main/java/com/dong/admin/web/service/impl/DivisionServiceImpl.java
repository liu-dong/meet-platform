package com.dong.admin.web.service.impl;

import com.dong.admin.web.dao.AdministrativeDivisionRepository;
import com.dong.admin.web.entity.AdministrativeDivision;
import com.dong.admin.web.service.DivisionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liudong 2022/4/5
 */
@Service
public class DivisionServiceImpl implements DivisionService {

    @Autowired
    AdministrativeDivisionRepository administrativeDivisionRepository;

    @Override
    public List<AdministrativeDivision> findProvinceList() {
        return administrativeDivisionRepository.findByDivisionType(1);
    }

    @Override
    public List<AdministrativeDivision> findSubordinateDivisionList(String parentCode) {
        return administrativeDivisionRepository.findByParentCode(parentCode);
    }
}
