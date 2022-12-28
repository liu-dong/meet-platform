package com.dong.adminserver.web.service.impl;

import com.alibaba.excel.util.StringUtils;
import com.dong.adminserver.web.dao.OrgJpaDao;
import com.dong.adminserver.web.dao.OrgPersonJpaDao;
import com.dong.adminserver.web.entity.Org;
import com.dong.adminserver.web.entity.OrgPerson;
import com.dong.adminserver.web.model.OrgInfoBean;
import com.dong.adminserver.web.model.PersonInfoBean;
import com.dong.adminserver.web.service.OrgInfoService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.enums.DeleteStatusEnum;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrgInfoServiceImpl implements OrgInfoService {

    @Autowired
    private OrgJpaDao orgJpaDao;
    @Autowired
    OrgPersonJpaDao orgPersonJpaDao;
    @Autowired
    CommonDao commonDao;

    /**
     * 查询组织机构列表
     *
     * @param bean
     * @param pager
     * @return
     */
    @Override
    public Pager<OrgInfoBean> findOrgInfoList(OrgInfoBean bean, Pager<OrgInfoBean> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT t1.id,t1.org_name orgName,t1.org_code orgCode,t1.org_type orgType, ");
        sql.append(" t1.create_time createTime,count(t2.person_id) personSum ");
        sql.append(" FROM sys_org t1 ");
        sql.append(" LEFT JOIN org_person t2 ON t2.org_id=t1.id ");
        sql.append(" WHERE t1.delete_status = 0 ");
        if (StringUtils.isNotBlank(bean.getOrgName())) {
            sql.append(" AND t1.org_name LIKE ? ");
            params.add("%" + bean.getOrgName().trim() + "%");
        }
        sql.append(" GROUP BY t1.id ");
        sql.append(" ORDER BY t1.create_time DESC ");
        return commonDao.findListBySql(pager, sql, params);
    }

    /**
     * 保存组织机构
     *
     * @param bean
     * @return
     */
    @Override
    public Org saveOrgInfo(OrgInfoBean bean) {
        Org entity = new Org();
        if (StringUtils.isEmpty(bean.getId())) {
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = orgJpaDao.getOne(bean.getId());
        }
        entity.setOrgName(bean.getOrgName());
        entity.setOrgCode(bean.getOrgCode());
        entity.setOrgType(bean.getOrgType());
        entity.setOrgDivisionCode(bean.getOrgDivisionCode());
        entity.setDeleteStatus(DeleteStatusEnum.valid.ordinal());
        entity.setOrgAddress(bean.getOrgAddress());
        entity.setUpdateTime(new Date());
        orgJpaDao.save(entity);
        return entity;
    }

    /**
     * 查询组织机构详情
     *
     * @param id
     * @return
     */
    @Override
    public Org getOrgInfo(String id) throws Exception {
        if (StringUtils.isEmpty(id)) {
            throw new Exception("查询失败，id不能为空!");
        }
        return orgJpaDao.getOne(id);
    }

    /**
     * 删除组织机构
     *
     * @param id
     * @return
     */
    @Override
    public void deleteOrgInfo(String id) throws Exception {
        if (StringUtils.isEmpty(id)) {
            throw new Exception("删除失败，id不能为空!");
        }
        orgJpaDao.deleteById(id);
    }

    @Override
    public Integer addPerson(String orgId, List<String> personIds) throws Exception {
        if (StringUtils.isEmpty(orgId)) {
            throw new Exception("添加人员失败，单位id不能为空");
        }
        if (CollectionUtils.isEmpty(personIds)) {
            throw new Exception("添加人员失败，人员id不能为空");
        }
        orgPersonJpaDao.deleteByOrgId(orgId);
        List<OrgPerson> entityList = new ArrayList<>();
        for (String personId : personIds) {
            OrgPerson entity = new OrgPerson();
            entity.setId(CommonUtils.getUUID());
            entity.setOrgId(orgId);
            entity.setPersonId(personId);
            entity.setCreateTime(new Date());
            entityList.add(entity);
        }
        orgPersonJpaDao.saveAll(entityList);
        return personIds.size();
    }

    @Override
    public Integer deletePerson(String orgId, List<String> personIds) throws Exception {
        if (StringUtils.isEmpty(orgId)) {
            throw new Exception("删除人员失败，单位id不能为空");
        }
        if (CollectionUtils.isEmpty(personIds)) {
            throw new Exception("删除人员失败，人员id不能为空");
        }
        orgPersonJpaDao.deleteByOrgIdAndPersonIdIn(orgId, personIds);
        return personIds.size();
    }

    @Override
    public List<PersonInfoBean> findOrgPersonInfoList(String orgId) {
        StringBuilder sql = new StringBuilder();
        List<Object> params = new ArrayList<>();
        sql.append(" SELECT t1.id,t1.company_id orgId,t1.`name`,t1.age, ");
        sql.append(" t1.sex,t1.phone,t1.email,t1.present_address presentAddress, ");
        sql.append(" t1.native_place nativePlace,t1.update_time updateTime ");
        sql.append(" FROM `person` t1 ");
        sql.append(" INNER JOIN org_person t2 ON t2.person_id=t1.id ");
        sql.append(" INNER JOIN sys_org t3 ON t3.id=t2.org_id ");
        sql.append(" WHERE t1.delete_status = 0 ");
        sql.append(" AND t3.id = ? ");
        params.add(orgId);
        return commonDao.findListBySql(sql, params, PersonInfoBean.class);
    }
}
