package com.dong.adminserver.web.controller;

import com.dong.adminserver.web.entity.Org;
import com.dong.adminserver.web.model.OrgInfoBean;
import com.dong.adminserver.web.model.PersonInfoBean;
import com.dong.adminserver.web.service.OrgInfoService;
import com.dong.commoncore.model.Pager;
import com.dong.commoncore.model.ResponseResult;
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
     * @param bean
     * @param pager
     * @return
     */
    @ApiOperation("查询组织机构列表")
    @PostMapping("/findOrgInfoList")
    public ResponseResult findOrgInfoList(@RequestBody OrgInfoBean bean, Pager<OrgInfoBean> pager) {
        Pager<OrgInfoBean> orgInfoList = orgInfoService.findOrgInfoList(bean, pager);
        return ResponseResult.success(orgInfoList, "保存成功!");
    }

    /**
     * 保存组织机构
     *
     * @param bean
     * @return
     */
    @ApiOperation("保存组织机构")
    @PostMapping("/saveOrgInfo")
    public ResponseResult saveOrgInfo(@RequestBody OrgInfoBean bean) {
        Org org = orgInfoService.saveOrgInfo(bean);
        return ResponseResult.success(org, "保存成功!");
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
            return ResponseResult.success(org, "查询成功!");
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
            return ResponseResult.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
    }

    /**
     * 添加人员
     *
     * @param bean
     * @return
     */
    @ApiOperation("添加人员")
    @PostMapping("/addPerson")
    public ResponseResult addPerson(@RequestBody OrgInfoBean bean) {
        try {
            orgInfoService.addPerson(bean.getId(), bean.getPersonIds());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
        return ResponseResult.success("添加成功!");
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
            List<PersonInfoBean> result = orgInfoService.findOrgPersonInfoList(orgId);
            return ResponseResult.success(result, "查询成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }

    }
}
