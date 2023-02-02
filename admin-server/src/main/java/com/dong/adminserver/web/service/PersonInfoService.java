package com.dong.adminserver.web.service;

import com.dong.adminserver.web.entity.Person;
import com.dong.adminserver.web.model.dto.PersonDTO;
import com.dong.adminserver.web.model.vo.PersonVO;
import com.dong.commoncore.model.Pager;

public interface PersonInfoService {

    /**
     * 查询人员信息列表
     *
     * @param dto
     * @param pager
     * @return
     */
    Pager<PersonVO> findPersonInfoList(PersonDTO dto, Pager<PersonVO> pager);

    /**
     * 保存人员信息
     *
     * @param dto
     * @return
     */
    Person savePersonInfo(PersonDTO dto);

    /**
     * 查询人员信息详细页面
     *
     * @param id
     * @return
     */
    Person getPersonInfo(String id);

    /**
     * 删除人员信息
     *
     * @param id
     */
    void deletePersonInfo(String id);

    /**
     * 选择单位
     *
     * @param dto
     * @return
     */
    Person chooseOrg(PersonDTO dto);
}
