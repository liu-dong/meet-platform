package com.dong.generator.web.model.dto;

import lombok.Data;

/**
 * 数据库参数信息
 *
 * @author LD 2021/5/24
 */
@Data
public class DatabaseDTO {

    private String address;
    private String port;
    private String username;
    private String password;
    private String databaseName;
    private String tableName;

}
