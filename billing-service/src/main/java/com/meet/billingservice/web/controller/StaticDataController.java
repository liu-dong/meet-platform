package com.meet.billingservice.web.controller;

import com.meet.billingservice.web.model.StaticSpecDTO;
import com.meet.billingservice.web.service.StaticDataService;
import com.meet.commoncore.model.ResponseResult;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liudong 2022/6/11
 */
@RestController
@RequestMapping("/static")
public class StaticDataController {

    @Autowired
    private StaticDataService staticDataService;

    @ApiOperation("查询")
    @GetMapping("/getStaticByCode")
    public ResponseResult getStaticByCode(String code) {
        try {
            StaticSpecDTO staticSpecDTO = staticDataService.findStaticSpec(code);
            return ResponseResult.success(staticSpecDTO, "查询成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
    }
}
