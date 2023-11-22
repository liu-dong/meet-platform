package com.dong.adminserver.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
import com.dong.user.entity.Org;
import com.dong.user.model.dto.OrgDTO;
import com.dong.user.model.vo.OrgVO;
import com.dong.user.model.vo.PersonVO;
import com.dong.user.service.OrgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 组织机构
 *
 * @author liudong
 */
@Api(tags = "组织机构管理模块")
@RestController
@RequestMapping("/org")
public class OrgController {

    @Autowired
    private OrgService orgService;

    /**
     * 查询组织机构列表
     *
     * @param dto
     * @param pager
     * @return
     */
    @ApiOperation("查询组织机构列表")
    @GetMapping("/findOrgList")
    public ResponseResult findOrgList(OrgDTO dto, Pager<OrgVO> pager) {
        Pager<OrgVO> orgList = orgService.findOrgList(dto, pager);
        return ResponseResult.success(orgList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 保存组织机构
     *
     * @param dto
     * @return
     */
    @ApiOperation("保存组织机构")
    @PostMapping("/saveOrg")
    public ResponseResult saveOrg(@RequestBody OrgDTO dto) {
        Org org = orgService.saveOrg(dto);
        return ResponseResult.success(org, ResponseMessageConstant.SAVE_SUCCESS);
    }

    /**
     * 查询组织机构
     *
     * @param id
     * @return
     */
    @ApiOperation("查询组织机构")
    @GetMapping("/getOrg")
    public ResponseResult getOrg(String id) {
        try {
            Org org = orgService.getOrg(id);
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
    @PostMapping("/deleteOrg")
    public ResponseResult deleteOrg(String id) {
        try {
            orgService.deleteOrg(id);
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
            orgService.addPerson(dto.getId(), dto.getPersonIds());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
        return ResponseResult.success(ResponseMessageConstant.OPERATE_SUCCESS);
    }

    /**
     * 查询当前单位所属人员列表
     *
     * @param orgId
     * @return
     */
    @ApiOperation("查询当前单位所属人员列表")
    @GetMapping("/findOrgPersonList")
    public ResponseResult findOrgPersonList(String orgId) {
        try {
            List<PersonVO> result = orgService.findOrgPersonList(orgId);
            return ResponseResult.success(result, ResponseMessageConstant.QUERY_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }

    }
}
