package com.dong.admin.web.service;


import com.dong.admin.web.entity.AdministrativeDivision;

import java.util.List;

/**
 * @author liudong 2022/4/5
 */
public interface DivisionService {

    /**
     * 查询省行政区划列表
     *
     * @return
     */
    List<AdministrativeDivision> findProvinceList();

    /**
     * 查询所属行政区划列表
     *
     * @param parentCode
     * @return
     */
    List<AdministrativeDivision> findSubordinateDivisionList(String parentCode);
}
