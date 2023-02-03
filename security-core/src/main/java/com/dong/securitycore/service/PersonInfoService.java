package com.dong.securitycore.service;

import com.dong.commoncore.model.Pager;
import com.dong.securitycore.entity.Person;
import com.dong.securitycore.model.dto.PersonDTO;
import com.dong.securitycore.model.vo.PersonVO;

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
