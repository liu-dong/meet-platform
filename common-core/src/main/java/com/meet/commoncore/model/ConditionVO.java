package com.meet.commoncore.model;

import lombok.Data;

/**
 * 查询条件基类
 *
 * @author LD 2021/8/17
 */
@Data
public class ConditionVO {
    private String userId;
    private String startTime;
    private String endTime;
}
