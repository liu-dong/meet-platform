package com.meet.commoncore.model;


import lombok.Data;

/**
 * @author LD 2021/5/28
 */
@Data
public class RedisDataBean {

    private String dataType;//数据类型
    private String key;
    private Object value;
    private String moduleName;//模块名称
}
