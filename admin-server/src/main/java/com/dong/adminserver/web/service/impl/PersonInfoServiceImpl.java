package com.dong.adminserver.web.service.impl;

import com.alibaba.excel.util.StringUtils;
import com.dong.adminserver.web.dao.PersonJpaDao;
import com.dong.adminserver.web.entity.Person;
import com.dong.adminserver.web.model.dto.PersonDTO;
import com.dong.adminserver.web.model.vo.PersonVO;
import com.dong.adminserver.web.service.PersonInfoService;
import com.dong.commoncore.dao.CommonDao;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.Pager;
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
     * @param dto
     * @param pager
     * @return
     */
    @Override
    public Pager<PersonVO> findPersonInfoList(PersonDTO dto, Pager<PersonVO> pager) {
        StringBuilder sql = new StringBuilder();
        List<Object> param = new ArrayList<>();
        sql.append(" SELECT t1.id,t1.org_id orgId,t1.`name`,t1.age, ");
        sql.append(" t1.sex,t1.phone,t1.email,t1.present_address presentAddress, ");
        sql.append(" t1.native_place nativePlace,t1.update_time updateTime ");
        sql.append(" FROM `sys_person` t1 ");
        sql.append(" LEFT JOIN sys_org_person t2 ON t2.person_id=t1.id ");
        sql.append(" LEFT JOIN sys_org t3 ON t3.id=t2.org_id ");
        sql.append(" WHERE t1.delete_status = 0 ");
        if (StringUtils.isNotBlank(dto.getName())) {
            sql.append(" AND t1.`name` LIKE ? ");
            param.add("%" + dto.getName().trim() + "%");
        }
        if (StringUtils.isNotBlank(dto.getIdentityCard())) {
            sql.append(" AND t1.identity_card LIKE ? ");
            param.add("%" + dto.getIdentityCard().trim() + "%");
        }
        if (StringUtils.isNotBlank(dto.getOrgName())) {
            sql.append(" AND t3.org_name LIKE ? ");
            param.add("%" + dto.getOrgName().trim() + "%");
        }
        if (StringUtils.isNotBlank(dto.getOrgId())) {
            sql.append(" AND t3.id = ? ");
            param.add(dto.getOrgId());
        }
        sql.append(" ORDER BY t1.update_time DESC ");
        return commonDao.findListBySql(pager, sql, param, PersonVO.class);
    }

    /**
     * 保存人员信息
     *
     * @param dto
     * @return
     */
    @Override
    public Person savePersonInfo(PersonDTO dto) {
        Person entity = new Person();
        if (StringUtils.isEmpty(dto.getId())) {//新增
            entity.setId(CommonUtils.getUUID());
            entity.setCreateTime(new Date());
        } else {
            entity = personJpaDao.findById(dto.getId()).orElse(new Person());
        }
        entity.setName(dto.getName());
        entity.setIdentityCard(dto.getIdentityCard());
        entity.setAge(dto.getAge());
        entity.setBirthdate(dto.getBirthdate());
        entity.setSex(Integer.valueOf(dto.getSex()));
        entity.setPhone(dto.getPhone());
        entity.setEmail(dto.getEmail());
        entity.setPresentAddress(dto.getPresentAddress());
        entity.setNativePlace(dto.getNativePlace());
        entity.setIndividualResume(dto.getIndividualResume());
        entity.setUpdateTime(new Date());
        return personJpaDao.save(entity);
    }

    /**
     * 查询人员信息详细页面
     *
     * @param id
     * @return
     */
    @Override
    public Person getPersonInfo(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("查询失败，id不能为空!");
        }
        return personJpaDao.findById(id).orElse(new Person());
    }

    /**
     * 删除人员信息
     *
     * @param id
     */
    @Override
    public void deletePersonInfo(String id) {
        if (StringUtils.isEmpty(id)) {
            throw new GlobalException("删除失败，id不能为空!");
        }
        personJpaDao.deleteById(id);
    }

    @Override
    public Person chooseOrg(PersonDTO dto) {
        if (StringUtils.isEmpty(dto.getId())) {
            throw new GlobalException("操作失败，人员id不能为空!");
        }
        Person entity = personJpaDao.findById(dto.getId()).orElse(new Person());
        entity.setOrgId(dto.getOrgId());
        entity.setUpdateTime(new Date());
        return personJpaDao.save(entity);
    }
}
