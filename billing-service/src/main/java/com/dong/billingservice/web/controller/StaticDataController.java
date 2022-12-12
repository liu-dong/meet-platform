package com.dong.billingservice.web.controller;

import com.dong.billingservice.web.model.StaticSpecDTO;
import com.dong.billingservice.web.model.StaticValueDTO;
import com.dong.billingservice.web.service.StaticDataService;
import com.dong.commoncore.model.ResponseResult;
import io.swagger.annotations.ApiOperation;
import java.util.List;
import java.util.Map;
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

    @ApiOperation("批量查询数据字典规格")
    @GetMapping("/batchGetStaticSpec")
    public ResponseResult batchGetStaticSpec() {
        try {
            Map<String, List<StaticValueDTO>> staticMap = staticDataService.batchGetStaticSpec();
            return ResponseResult.success(staticMap, "查询成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.error(e.getMessage());
        }
    }
}
