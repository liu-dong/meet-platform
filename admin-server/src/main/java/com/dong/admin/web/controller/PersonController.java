package com.dong.admin.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.PageVO;
import com.dong.commoncore.model.Pagination;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.entity.Person;
import com.dong.user.model.dto.PersonDTO;
import com.dong.user.model.vo.PersonVO;
import com.dong.user.service.PersonService;
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
@RequestMapping("/person")
public class PersonController {

    @Autowired
    private PersonService personService;

    /**
     * 查询人员信息列表
     *
     * @param dto
     * @param pagination
     * @return
     */
    @ApiOperation("查询人员信息列表")
    @GetMapping("/findPersonList")
    public ResponseResult findPersonList(PersonDTO dto, Pagination pagination) {
        PageVO<PersonVO> personList = personService.findPersonList(dto, pagination);
        return ResponseResult.success(personList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存人员信息
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存人员信息")
    @PostMapping(value = "/savePerson")
    public ResponseResult savePerson(@RequestBody PersonDTO dto) {
        Person person = personService.savePerson(dto);
        return ResponseResult.success(person, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询人员信息详细页面
     *
     * @param id
     * @return
     */
    @ApiOperation("查询人员信息")
    @GetMapping("/getPerson")
    public ResponseResult getPerson(String id) {
        Person person = personService.getPerson(id);
        return ResponseResult.success(person, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 删除人员信息
     *
     * @param id
     * @return
     */
    @ApiOperation("删除人员信息")
    @PostMapping("/deletePerson")
    public ResponseResult deletePerson(String id) {
        personService.deletePerson(id);
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
        personService.chooseOrg(dto);
        return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
    }
}
