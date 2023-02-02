package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.Org;
import com.dong.adminserver.web.model.PersonInfoBean;
import com.dong.adminserver.web.model.dto.OrgDTO;
import com.dong.adminserver.web.model.vo.OrgVO;
import com.dong.commoncore.model.Pager;

import java.util.List;

public interface OrgInfoService {

    /**
     * 查询组织机构列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<OrgVO> findOrgInfoList(OrgDTO dto, Pager<OrgVO> pager);

    /**
     * 保存组织机构
     *
     * @param dto
     * @return
     */
    Org saveOrgInfo(OrgDTO dto);

    /**
     * 查询组织机构详情
     *
     * @param id
     * @return
     */
    Org getOrgInfo(String id) throws Exception;

    /**
     * 删除组织机构
     *
     * @param id
     * @return
     */
    void deleteOrgInfo(String id) throws Exception;

    Integer addPerson(String orgId, List<String> personIds) throws Exception;

    Integer deletePerson(String orgId, List<String> personIds) throws Exception;

    List<PersonInfoBean> findOrgPersonInfoList(String orgId);
}
