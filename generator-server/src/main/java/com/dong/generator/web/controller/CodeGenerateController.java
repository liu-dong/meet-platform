//package com.dong.generator.web.controller;
//
//import com.dong.commoncore.model.ResponseResult;
//import com.dong.generator.web.model.dto.CodeGenerateParamDTO;
//import com.dong.generator.web.service.CodeGenerateService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * 代码生成
// *
// * @author liudong
// */
//@RestController
//@RequestMapping("/codeGenerate")
//public class CodeGenerateController {
//
//
//    @Autowired
//    CodeGenerateService codeGenerateService;
//
//    /**
//     * 批量生成
//     *
//     * @param dto
//     * @return
//     */
//    @PostMapping("/batchGenerate")
//    public ResponseResult batchGenerate(@RequestBody CodeGenerateParamDTO dto) {
//        List<String> list = new ArrayList<>();
//        try {
//            list = codeGenerateService.batchGenerate(dto);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return ResponseResult.success(list, "代码生成成功！");
//    }
//
//}
