package com.dong.billingservice.web.model;

import lombok.Data;

import java.util.Date;

/**
 * @author liudong 2022/5/28
 */
@Data
public class QueryParam {

    /** 记录时间 */
    private Date recordTime;
    /** 支出类型 0：其他、1：餐饮、2：交通、3：房租、4：娱乐、5：通讯、6：学习、7：购物 */
    private Integer spendingType;

    private Integer pageNum;

    private Integer pageSize;

}
