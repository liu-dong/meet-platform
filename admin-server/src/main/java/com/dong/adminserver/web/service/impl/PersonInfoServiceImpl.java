package com.dong.adminserver.web.service.impl;

import com.alibaba.excel.util.StringUtils;
import com.dong.adminserver.web.dao.PersonJpaDao;
import com.dong.adminserver.web.entity.Person;
import com.dong.adminserver.web.model.PersonInfoBean;
import com.dong.adminserver.web.service.PersonInfoService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class PersonInfoServiceImpl implements PersonInfoService {

    @Autowired
    PersonJpaDao personJpaDao;
    @Autowired
    CommonDao commonDao;

    /**
     * 查询人员信息列表
     *
     * @param bean
     * @param pager
     * @return
     */
    @Override
    public Pager<PersonInfoBean> findPersonInfoList(PersonInfoBean bean, Pager<PersonInfoBean> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT t1.id,t1.company_id orgId,t1.`name`,t1.age, ");
        sql.append(" t1.sex,t1.phone,t1.email,t1.present_address presentAddress, ");
        sql.append(" t1.native_place nativePlace,t1.update_time updateTime ");
        sql.append(" FROM `person` t1 ");
        sql.append(" LEFT JOIN org_person t2 ON t2.person_id=t1.id ");
        sql.append(" LEFT JOIN sys_org t3 ON t3.id=t2.org_id ");
        sql.append(" WHERE t1.delete_status = 0 ");
        if (StringUtils.isNotBlank(bean.getName())) {
            sql.append(" AND t1.`name` LIKE ? ");
            param.add("%" + bean.getName().trim() + "%");
        }
        if (StringUtils.isNotBlank(bean.getIdentityCard())) {
            sql.append(" AND t1.identity_card LIKE ? ");
            param.add("%" + bean.getIdentityCard().trim() + "%");
        }
        if (StringUtils.isNotBlank(bean.getOrgName())) {
            sql.append(" AND t3.org_name LIKE ? ");
            param.add("%" + bean.getOrgName().trim() + "%");
        }
        if (StringUtils.isNotBlank(bean.getOrgId())) {
            sql.append(" AND t3.id = ? ");
            param.add(bean.getOrgId());
        }
        sql.append(" ORDER BY t1.update_time DESC ");
        return commonDao.findListBySql(pager, sql, param);
    }

    /**
     * 保存人员信息
     *
     * @param bean
     * @return
     */
    @Override
    public ResponseResult savePersonInfo(PersonInfoBean bean) {
        Person entity = new Person();
        if (StringUtils.isEmpty(bean.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = personJpaDao.getOne(bean.getId());
        }
        entity.setName(bean.getName());
        entity.setIdentityCard(bean.getIdentityCard());
        entity.setAge(bean.getAge());
        entity.setBirthdate(bean.getBirthdate());
        entity.setSex(Integer.valueOf(bean.getSex()));
        entity.setPhone(bean.getPhone());
        entity.setEmail(bean.getEmail());
        entity.setPresentAddress(bean.getPresentAddress());
        entity.setNativePlace(bean.getNativePlace());
        entity.setIndividualResume(bean.getIndividualResume());
        entity.setUpdateTime(new Date());
        entity = personJpaDao.save(entity);
        return ResponseResult.success(entity, "保存成功!");
    }

    /**
     * 查询人员信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult getPersonInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            Person entity = personJpaDao.getOne(id);
            return ResponseResult.success(entity, "查询成功!");
        }
        return ResponseResult.error("查询失败，id不能为空!");
    }

    /**
     * 删除人员信息
     *
     * @param id
     * @return
     */
    @Override
    public ResponseResult deletePersonInfo(String id) {
        if (!StringUtils.isEmpty(id)) {
            personJpaDao.deleteById(id);
            return ResponseResult.success("删除成功!");
        }
        return ResponseResult.error("删除失败，id不能为空!");
    }

    @Override
    public ResponseResult chooseCompany(PersonInfoBean bean) {
        if (!StringUtils.isEmpty(bean.getId())) {
            Person entity = personJpaDao.getOne(bean.getId());
            entity.setCompanyId(bean.getOrgId());
            entity.setUpdateTime(new Date());
            personJpaDao.save(entity);
            return ResponseResult.success("单位选择成功!");
        }
        return ResponseResult.error("操作失败，人员id不能为空!");
    }
}
