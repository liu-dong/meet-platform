package com.dong.adminserver.web.service;

import com.dong.adminserver.web.model.PersonInfoBean;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;

public interface PersonInfoService {

    /**
     * 查询人员信息列表
     *
     * @param bean
     * @param pager
     * @return
     */
    Pager<PersonInfoBean> findPersonInfoList(PersonInfoBean bean, Pager<PersonInfoBean> pager);

    /**
     * 保存人员信息
     *
     * @param bean
     * @return
     */
    ResponseResult savePersonInfo(PersonInfoBean bean);

    /**
     * 查询人员信息详细页面
     *
     * @param id
     * @return
     */
    ResponseResult getPersonInfo(String id);

    /**
     * 删除人员信息
     *
     * @param id
     * @return
     */
    ResponseResult deletePersonInfo(String id);

    /**
     * 选择单位
     *
     * @param bean
     * @return
     */
    ResponseResult chooseCompany(PersonInfoBean bean);
}
