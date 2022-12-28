package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.Org;
import com.dong.adminserver.web.model.OrgInfoBean;
import com.dong.adminserver.web.model.PersonInfoBean;
import com.dong.commoncore.model.Pager;

import java.util.List;

public interface OrgInfoService {

    /**
     * 查询组织机构列表
     *
     * @param bean
     * @param pager
     * @return
     */
    Pager<OrgInfoBean> findOrgInfoList(OrgInfoBean bean, Pager<OrgInfoBean> pager);

    /**
     * 保存组织机构
     *
     * @param bean
     * @return
     */
    Org saveOrgInfo(OrgInfoBean bean);

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
