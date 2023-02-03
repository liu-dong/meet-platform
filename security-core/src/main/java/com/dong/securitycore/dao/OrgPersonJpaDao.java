package com.dong.securitycore.dao;

import com.dong.securitycore.entity.OrgPerson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface OrgPersonJpaDao extends JpaRepository<OrgPerson, String> {

    /**
     * 根据单位id删除
     *
     * @param orgId
     * @return
     */
    @Transactional
    @Modifying
    int deleteByOrgId(String orgId);

    /**
     * 根据人员id删除
     *
     * @param orgId
     * @param personIds
     * @return
     */
    @Transactional
    @Modifying
    int deleteByOrgIdAndPersonIdIn(String orgId, List<String> personIds);
}
