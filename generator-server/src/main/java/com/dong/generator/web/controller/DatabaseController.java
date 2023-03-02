package com.dong.generator.web.controller;

import com.dong.commoncore.constant.ResponseMessageConstant;
import com.dong.commoncore.constant.SymbolConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.generator.constant.DatabaseConstant;
import com.dong.generator.util.DatabaseUtils;
import com.dong.generator.util.JDBCUtils;
import com.dong.generator.web.model.dto.DatabaseDTO;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 数据库信息管理
 *
 * @author LD
 */
@RestController
@RequestMapping("/database")
public class DatabaseController {

    @Value("${spring.datasource.url}")
    private String url;
    @Value("${spring.datasource.username}")
    private String username;
    @Value("${spring.datasource.password}")
    private String password;

    /**
     * 查询所有数据库表
     *
     * @param dto
     * @return
     */
    @GetMapping("/findDatabaseList")
    public ResponseResult findDatabaseList(DatabaseDTO dto) {
        if(StringUtils.isNotBlank(dto.getAddress()) && StringUtils.isNotBlank(dto.getPort())){
            url = getUrl(dto);
        }
        if(StringUtils.isNotBlank(dto.getUsername())){
            username = dto.getUsername();
        }
        if(StringUtils.isNotBlank(dto.getPassword())){
            password = dto.getPassword();
        }
        JDBCUtils.close();
        JDBCUtils.createConnection(url,username,password);
        List<String> databaseList = DatabaseUtils.getCatalogList();
        return ResponseResult.success(databaseList, ResponseMessageConstant.QUERY_SUCCESS);
    }

    /**
     * 获取数据库地址
     *
     * @param dto
     * @return
     */
    @NotNull
    private static String getUrl(DatabaseDTO dto) {
        StringBuilder result = new StringBuilder();
        result.append(DatabaseConstant.JDBC_URL_PREFIX);
        result.append(dto.getAddress());
        result.append(SymbolConstant.COLON);
        result.append(dto.getPort());
        result.append(DatabaseConstant.JDBC_URL_SUFFIX);
        return result.toString();
    }

    /**
     * 查询数据表列表
     *
     * @param dto
     * @return
     */
    @GetMapping("/findTableList")
    public ResponseResult findTableList(DatabaseDTO dto) {
        if (StringUtils.isBlank(dto.getDatabaseName())){
            throw new GlobalException("数据库名不能为空");
        }
        List<Map<String, String>> tableList = DatabaseUtils.getTableList(dto.getDatabaseName());
        return ResponseResult.success(tableList, ResponseMessageConstant.QUERY_SUCCESS);
    }
}
