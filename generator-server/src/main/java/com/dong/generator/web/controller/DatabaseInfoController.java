package com.dong.generator.web.controller;

import com.dong.commoncore.model.ResponseResult;
import com.dong.generator.web.model.DatabasesInfoBean;
import com.dong.generator.web.service.DatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 数据库信息管理
 *
 * @author LD
 */
@RestController
public class DatabaseInfoController {

    @Autowired
    private DatabaseService databaseService;

    /**
     * 查询数据表列表
     *
     * @param bean
     * @return
     */
    @GetMapping("/findDatabasesList")
    public ResponseResult findDatabasesInfoList(DatabasesInfoBean bean) {
        return databaseService.findDatabasesInfoList(bean);
    }

    /**
     * 查询数据表列表
     *
     * @param bean
     * @return
     */
    @GetMapping("/findTableList")
    public ResponseResult findTableInfoList(DatabasesInfoBean bean) {
        return databaseService.findTableInfoList(bean);
    }
}
