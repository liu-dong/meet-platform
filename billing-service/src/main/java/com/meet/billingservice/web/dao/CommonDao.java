package com.meet.billingservice.web.dao;

import com.meet.billingservice.web.model.Pager;

import java.util.List;
import java.util.Map;

public interface CommonDao {

    /**
     * 分页列表查询
     * @param pager
     * @param sql
     * @param params
     * @param clazz 指定返回对象
     * @return 返回分页对象
     */
    <T> Pager<T> findListBySql(Pager<T> pager, StringBuilder sql, List<Object> params, Class<T> clazz);

    /**
     * 分页列表查询
     *
     * @param pager
     * @param sql
     * @param params
     * @return 返回分页对象
     */
    <T> Pager<T> findListBySql(Pager<T> pager, StringBuilder sql, List<Object> params);


    /**
     * 分页列表查询
     *
     * @param sql
     * @param params
     * @param page
     * @param limit
     * @return 返回list对象
     */
    <T> List<T> findListBySql(StringBuilder sql, List<Object> params, int page, int limit);

    /**
     * 列表查询
     *
     * @param sql
     * @param params
     * @return 返回list对象
     */
    <T> List<T> findListBySql(StringBuilder sql, List<Object> params);

    /**
     * 分页列表查询
     *
     * @param sql
     * @param params
     * @param page
     * @param limit
     * @return 返回listMap对象
     */
    List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params, int page, int limit);

    /**
     * 列表查询
     *
     * @param sql
     * @param params
     * @return 返回listMap对象
     */
    List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params);

    /**
     * 获取记录总数
     *
     * @param sql
     * @param params
     * @return 返回记录数
     */
    Integer getTotalBySql(StringBuilder sql, List<Object> params);

}
