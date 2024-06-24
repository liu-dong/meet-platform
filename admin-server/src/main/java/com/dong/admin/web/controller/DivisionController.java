package com.dong.admin.web.controller;

import com.dong.admin.web.entity.AdministrativeDivision;
import com.dong.admin.web.service.DivisionService;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author liudong 2022/4/5
 */
@Api(tags = "行政区划模块")
@RestController
@RequestMapping("/division")
public class DivisionController {

    @Autowired
    DivisionService divisionService;

    /**
     * 查询省行政区划列表
     *
     * @return
     */
    @ApiOperation("查询省行政区划列表")
    @PostMapping("/findProvinceList")
    public ResponseResult<List<AdministrativeDivision>> findProvinceList(){
        List<AdministrativeDivision> provinceList = divisionService.findProvinceList();
        return ResponseResult.success(provinceList,"查询成功！");
    }

    /**
     * 查询所属行政区划列表
     *
     * @param parentCode
     * @return
     */
    @ApiOperation("查询省行政区划列表")
    @PostMapping("/findSubordinateDivisionList")
    public ResponseResult<List<AdministrativeDivision>> findSubordinateDivisionList(String parentCode){
        if (StringUtils.isEmpty(parentCode)){
            return ResponseResult.error("查询失败，父区划编码不能为空！");
        }
        List<AdministrativeDivision> provinceList = divisionService.findSubordinateDivisionList(parentCode);
        return ResponseResult.success(provinceList,"查询成功！");
    }

}
