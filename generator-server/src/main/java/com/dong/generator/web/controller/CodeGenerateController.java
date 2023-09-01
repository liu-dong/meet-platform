package com.dong.generator.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.generator.util.CodeGenerateUtils;
import com.dong.generator.web.model.dto.CodeGenerateParamDTO;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


/**
 * 代码自动生成模块
 *
 * @author LD
 */
@RestController
public class CodeGenerateController {

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    /**
     * 批量生成代码
     *
     * @param dto
     * @return
     */
    @PostMapping("/batchGenerate")
    @ResponseBody
    public ResponseResult batchGenerate(@RequestBody CodeGenerateParamDTO dto) {
        List<String> list = new ArrayList<>();
        try {
            list = CodeGenerateUtils.batchGenerate(dto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseResult.success(list, "代码生成成功！");
    }
}
