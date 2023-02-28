package com.dong.generator.web.model;

import lombok.Data;

/**
 * @author LD 2021/5/24
 */
@Data
public class DatabasesInfoBean {

    private String address;
    private String port;
    private String username;
    private String password;
    private String databasesName;
    private String tableName;

}
