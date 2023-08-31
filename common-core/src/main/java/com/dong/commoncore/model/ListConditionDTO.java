package com.dong.commoncore.model;

import lombok.Data;

/**
 * 查询条件基类
 *
 * @author LD 2021/8/17
 */
@Data
public class ListConditionDTO {

    /**
     * 当前页码
     */
    private int page = 1;
    /**
     * 每页数量
     */
    private int limit = 10;
    private String userId;
    private String startTime;
    private String endTime;
}
