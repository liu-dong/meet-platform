package com.dong.generator.web.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 模板属性对象
 *
 * @author LD
 * @date 2020/6/17 16:40
 */
@Getter
@Setter
@AllArgsConstructor
@ToString
public class AttributeDTO {

    /**
     * 列名称
     */
    private String columnName;

    /**
     * 类型名称
     */
    private String typeName;

    /**
     * 注释
     */
    private String comment;

}
