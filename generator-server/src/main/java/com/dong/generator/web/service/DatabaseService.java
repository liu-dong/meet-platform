package com.dong.generator.web.service;

import com.dong.commoncore.model.ResponseResult;
import com.dong.generator.web.model.DatabasesInfoBean;

/**
 * @author LD
 */
public interface DatabaseService {

    ResponseResult findTableInfoList(DatabasesInfoBean bean);

    ResponseResult findDatabasesInfoList(DatabasesInfoBean bean);
}
