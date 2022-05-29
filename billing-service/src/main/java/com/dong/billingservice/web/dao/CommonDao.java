package com.dong.billingservice.web.dao;

import com.dong.billingservice.web.model.Pager;
import java.util.List;
import java.util.Map;

public interface CommonDao {

    /**
     * 分页列表查询
     *
     * @param pager
     * @param sql
     * @param params
     * @return
     */
    <T> Pager<T> findListBySql(Pager<T> pager, StringBuilder sql, List<Object> params);


    /**
     * 分页列表查询
     *
     * @param sql
     * @param params
     * @param page
     * @param limit
     * @return
     */

    <T> List<T> findListBySql(StringBuilder sql, List<Object> params, int page, int limit);

    /**
     * 列表查询
     *
     * @param sql
     * @param params
     * @return
     */

    <T> List<T> findListBySql(StringBuilder sql, List<Object> params);

    /**
     * 分页列表查询
     *
     * @param sql
     * @param params
     * @param page
     * @param limit
     * @return
     */

    List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params, int page, int limit);

    /**
     * 列表查询
     *
     * @param sql
     * @param params
     * @return
     */

    List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params);

    /**
     * 获取记录总数
     *
     * @param sql
     * @param params
     * @return
     */

    Integer getTotalBySql(StringBuilder sql, List<Object> params);

}
