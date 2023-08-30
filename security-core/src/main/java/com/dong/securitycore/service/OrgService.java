package com.dong.securitycore.service;

import com.dong.commoncore.model.Pager;
import com.dong.securitycore.entity.Org;
import com.dong.securitycore.model.dto.OrgDTO;
import com.dong.securitycore.model.vo.OrgVO;
import com.dong.securitycore.model.vo.PersonVO;

import java.util.List;

public interface OrgService {

    /**
     * 查询组织机构列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<OrgVO> findOrgList(OrgDTO dto, Pager<OrgVO> pager);

    /**
     * 保存组织机构
     *
     * @param dto
     * @return
     */
    Org saveOrg(OrgDTO dto);

    /**
     * 查询组织机构详情
     *
     * @param id
     * @return
     */
    Org getOrg(String id) throws Exception;

    /**
     * 删除组织机构
     *
     * @param id
     * @return
     */
    void deleteOrg(String id) throws Exception;

    Integer addPerson(String orgId, List<String> personIds) throws Exception;

    Integer deletePerson(String orgId, List<String> personIds) throws Exception;

    List<PersonVO> findOrgPersonList(String orgId);
}
