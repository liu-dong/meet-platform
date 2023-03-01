package com.dong.generator.web.model;

import lombok.Data;

import java.util.List;

/**
 * 代码生成参数信息
 *
 * @author LD
 */
@Data
public class GenerateParamInfoBean {

    /**
     * 包名
     */
    private String packageName;

    /**
     * 表名
     */
    private List<String> tableName;

    /**
     * 表注释
     */
    private List<String> classAnnotation;

    /**
     * 模板名称
     */
    private List<String> templateName;

    /**
     * 模板名称
     */
    private String template;

    /**
     * 生成路径
     */
    private String generatePath;

    /**
     * 文件名
     */
    private String fileName;

}
