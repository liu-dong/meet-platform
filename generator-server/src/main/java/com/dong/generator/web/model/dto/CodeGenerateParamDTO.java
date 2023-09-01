package com.dong.generator.web.model.dto;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 代码生成参数
 *
 * @author liudong
 * @date 2023/3/1 10:39
 */
@Data
public class CodeGenerateParamDTO {

    /**
     * 数据库名称
     */
    private String databaseName;

    /**
     * 包名
     */
    private String packageName;

    /**
     * K-V -> 表名—表注释
     */
    private Map<String, String> tableNameComment;

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
     * 类名/文件名
     */
    private String fileName;
}
