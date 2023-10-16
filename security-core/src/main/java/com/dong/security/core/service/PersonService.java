package com.dong.security.core.service;

import com.dong.commoncore.model.Pager;
import com.dong.security.core.entity.Person;
import com.dong.security.core.model.dto.PersonDTO;
import com.dong.security.core.model.vo.PersonVO;

public interface PersonService {

    /**
     * 查询人员信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<PersonVO> findPersonList(PersonDTO dto, Pager<PersonVO> pager);

    /**
     * 保存人员信息
     *
     * @param dto
     * @return
     */
    Person savePerson(PersonDTO dto);

    /**
     * 查询人员信息详细页面
     *
     * @param id
     * @return
     */
    Person getPerson(String id);

    /**
     * 删除人员信息
     *
     * @param id
     */
    void deletePerson(String id);

    /**
     * 选择单位
     *
     * @param dto
     * @return
     */
    Person chooseOrg(PersonDTO dto);
}
