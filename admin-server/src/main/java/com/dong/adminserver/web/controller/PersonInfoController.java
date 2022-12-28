package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.model.PersonInfoBean;
import com.dong.adminserver.web.service.PersonInfoService;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 人员信息管理
 *
 * @author LD
 */
@Api(tags = "人员信息管理模块")
@RestController
@RequestMapping("/personInfo")
public class PersonInfoController {

    @Autowired
    private PersonInfoService personInfoService;

    /**
     * 查询人员信息列表
     *
     * @param bean
     * @param pager
     * @return
     */
    @ApiOperation("查询人员信息列表")
    @PostMapping("/findPersonInfoList")
    public ResponseResult findPersonInfoList(@RequestBody PersonInfoBean bean, Pager<PersonInfoBean> pager) {
        Pager<PersonInfoBean> personInfoList = personInfoService.findPersonInfoList(bean, pager);
        return ResponseResult.success(personInfoList, "查询成功！");
    }

    /**
     * 保存人员信息
     *
     * @param bean
     * @return
     */
    @ApiOperation("保存人员信息")
    @PostMapping(value = "/savePersonInfo", produces = "application/json;charset=utf-8")
    public ResponseResult savePersonInfo(@RequestBody PersonInfoBean bean) {
        return personInfoService.savePersonInfo(bean);
    }

    /**
     * 查询人员信息详细页面
     *
     * @param id
     * @return
     */
    @ApiOperation("查询人员信息")
    @GetMapping("/getPersonInfo")
    public ResponseResult getPersonInfo(String id) {
        return personInfoService.getPersonInfo(id);
    }

    /**
     * 删除人员信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除人员信息")
    @PostMapping("/deletePersonInfo")
    public ResponseResult deletePersonInfo(String id) {
        return personInfoService.deletePersonInfo(id);
    }

    /**
     * 选择单位
     *
     * @param bean
     * @return
     */
    @ApiOperation("选择单位")
    @PostMapping("/chooseCompany")
    public ResponseResult chooseCompany(PersonInfoBean bean) {
        return personInfoService.chooseCompany(bean);
    }
}
