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

    private String packageName;//包名
    private List<String> tableName;//表名
    private List<String> classAnnotation;//表注释
    private List<String> templateName;//模板名称
    private String template;//模板名称
    private String generatePath;//生成路径
    private String fileName;//文件名

}
