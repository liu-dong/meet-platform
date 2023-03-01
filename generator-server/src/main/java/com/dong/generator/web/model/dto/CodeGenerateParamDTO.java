package com.dong.generator.web.model.dto;

import lombok.Data;

import java.util.List;

/**
 * 代码生成参数信息
 *
 * @author liudong
 * @date 2023/3/1 10:39
 */
@Data
public class CodeGenerateParamDTO {

    /**
     * 包名
     */
    private String packageName;

    /**
     * 表名
     */
    private List<String> tableNameList;

    /**
     * 表注释
     */
    private List<String> tableComment;

    /**
     * 模板名称
     */
    private List<String> templateNameList;

    /**
     * 模板名称
     */
    private String templateName;

    /**
     * 生成路径
     */
    private String generatePath;

    /**
     * 类名
     */
    private String className;
}
