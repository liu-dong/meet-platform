package com.dong.adminserver.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.securitycore.entity.Org;
import com.dong.securitycore.model.dto.OrgDTO;
import com.dong.securitycore.model.vo.OrgVO;
import com.dong.securitycore.model.vo.PersonVO;
import com.dong.securitycore.service.OrgInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 组织机构
 *
 * @author Lenovo
 */
@Api(tags = "组织机构管理模块")
@RestController
@RequestMapping("/orgInfo")
public class OrgInfoController {

    @Autowired
    private OrgInfoService orgInfoService;

    /**
     * 查询组织机构列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @ApiOperation("查询组织机构列表")
    @PostMapping("/findOrgInfoList")
    public ResponseResult findOrgInfoList(@RequestBody OrgDTO dto, Pager<OrgVO> pager) {
        Pager<OrgVO> orgInfoList = orgInfoService.findOrgInfoList(dto, pager);
        return ResponseResult.success(orgInfoList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存组织机构
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存组织机构")
    @PostMapping("/saveOrgInfo")
    public ResponseResult saveOrgInfo(@RequestBody OrgDTO dto) {
        Org org = orgInfoService.saveOrgInfo(dto);
        return ResponseResult.success(org, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询组织机构
     *
     * @param id
     * @return
     */
    @ApiOperation("查询组织机构")
    @GetMapping("/getOrgInfo")
    public ResponseResult getOrgInfo(String id) {
        try {
            Org org = orgInfoService.getOrgInfo(id);
            return ResponseResult.success(org, ResponseMessageConstant.QUERY_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
    }

    /**
     * 删除组织机构
     *
     * @param id
     * @return
     */
    @ApiOperation("删除组织机构")
    @PostMapping("/deleteOrgInfo")
    public ResponseResult deleteOrgInfo(String id) {
        try {
            orgInfoService.deleteOrgInfo(id);
            return ResponseResult.success(ResponseMessageConstant.DELETE_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
    }

    /**
     * 添加人员
     *
     * @param dto
     * @return
     */
    @ApiOperation("添加人员")
    @PostMapping("/addPerson")
    public ResponseResult addPerson(@RequestBody OrgDTO dto) {
        try {
            orgInfoService.addPerson(dto.getId(), dto.getPersonIds());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
        return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
    }

    /**
     * 添加人员
     *
     * @param orgId
     * @return
     */
    @ApiOperation("查询当前单位所属人员列表")
    @GetMapping("/findOrgPersonInfoList")
    public ResponseResult findOrgPersonInfoList(String orgId) {
        try {
            List<PersonVO> result = orgInfoService.findOrgPersonInfoList(orgId);
            return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }

    }
}
