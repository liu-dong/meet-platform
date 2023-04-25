package com.dong.demo.web;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.model.ResponseResult;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liudong
 * @date 2023/4/25
 */
@RestController
@RequestMapping("/demo")
public class DemoController {

    @RequestMapping("/test")
    public ResponseResult test(String id) {
        Assert.notNull(id, "不能为空");
        return ResponseResult.success(id, ResponseMessageConstant.OPERATE_SUCCESS);
    }
}
