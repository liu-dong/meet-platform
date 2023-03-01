package com.dong.generator.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.generator.util.CodeGenerateUtils;
import com.dong.generator.web.model.GenerateParamInfoBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;


/**
 * 代码自动生成模块
 *
 * @author LD
 */
@Controller
public class GenerateController {

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @PostMapping("/batchGenerate")
    @ResponseBody
    public ResponseResult batchGenerate(@RequestBody GenerateParamInfoBean bean) {
        List<String> list = new ArrayList<>();
        try {

            list = CodeGenerateUtils.batchGenerate(bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.success(list, "代码生成成功！");
    }
}