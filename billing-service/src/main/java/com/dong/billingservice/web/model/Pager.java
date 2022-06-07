package com.dong.billingservice.web.model;

import lombok.Data;

import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * 分页
 *
 * @author LD
 */
@Data
public class Pager<T> {

    /**
     * 当前页码
     */
    private int page;
    /**
     * 每页数量
     */
    private int limit;
    /**
     * 记录总数
     */
    private long total;
    /**
     * 页码总数
     */
    private int pageTotal;
    /**
     * 分页数据
     */
    private List<T> dataList;

    public Pager() {
        this.page = 1;
        this.limit = 10000;
    }
}
