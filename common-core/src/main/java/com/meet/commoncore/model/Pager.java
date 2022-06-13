package com.meet.commoncore.model;


import com.meet.commoncore.util.CommonUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 分页
 *
 * @author LD
 */
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(int pageTotal) {
        this.pageTotal = pageTotal;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }
}
