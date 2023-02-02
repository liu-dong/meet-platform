package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.entity.Person;
import com.dong.adminserver.web.model.dto.PersonDTO;
import com.dong.adminserver.web.model.vo.PersonVO;
import com.dong.adminserver.web.service.PersonInfoService;
import com.dong.commoncore.constant.ResponseMessageConstant;
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
     * @param dto
     * @param pager
     * @return
     */
    @ApiOperation("查询人员信息列表")
    @PostMapping("/findPersonInfoList")
    public ResponseResult findPersonInfoList(@RequestBody PersonDTO dto, Pager<PersonVO> pager) {
        Pager<PersonVO> personInfoList = personInfoService.findPersonInfoList(dto, pager);
        return ResponseResult.success(personInfoList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存人员信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存人员信息")
    @PostMapping(value = "/savePersonInfo")
    public ResponseResult savePersonInfo(@RequestBody PersonDTO dto) {
        Person person = personInfoService.savePersonInfo(dto);
        return ResponseResult.success(person, ResponseMessageConstant.SAVE_SUCCESS);
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
        Person person = personInfoService.getPersonInfo(id);
        return ResponseResult.success(person, ResponseMessageConstant.QUERY_SUCCESS);
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
        personInfoService.deletePersonInfo(id);
        return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
    }

    /**
     * 选择单位
     *
     * @param dto
     * @return
     */
    @ApiOperation("选择单位")
    @PostMapping("/chooseOrg")
    public ResponseResult chooseOrg(PersonDTO dto) {
        personInfoService.chooseOrg(dto);
        return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
    }
}
