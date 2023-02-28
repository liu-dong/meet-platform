package com.dong.generator.web.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 * 模板属性对象
 *
 * @author LD
 * @date 2020/6/17 16:40
 */
@Getter
@Setter
@AllArgsConstructor
public class AttributeBean {

    private String columnName;//列名称
    private String typeName;//类型名称
    private String remark;//注释

}
