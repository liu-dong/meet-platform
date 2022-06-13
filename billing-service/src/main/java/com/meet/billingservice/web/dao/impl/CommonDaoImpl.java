package com.dong.billingservice.web.dao.impl;

import com.dong.billingservice.util.CommonUtils;
import com.dong.billingservice.web.dao.CommonDao;
import com.dong.billingservice.web.model.Pager;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author liudong
 */
@Repository
public class CommonDaoImpl implements CommonDao {

    @PersistenceContext
    private EntityManager entityManager;

    /**
     * 分页列表查询
     *
     * @param pager
     * @param sql
     * @param params
     * @param clazz  指定返回对象
     * @return 返回分页对象
     */
    @Override
    public <T> Pager<T> findListBySql(Pager<T> pager, StringBuilder sql, List<Object> params, Class<T> clazz) {
        Query query = getQuery(sql, params, pager.getPage(), pager.getLimit());
        pager.setTotal(this.getTotalBySql(sql, params));
        pager.convertDataList(query.getResultList(), clazz);
        return pager;
    }

    /**
     * 分页列表查询
     *
     * @param pager
     * @param sql
     * @param params
     * @return 返回分页对象
     */
    @Override
    public <T> Pager<T> findListBySql(Pager<T> pager, StringBuilder sql, List<Object> params) {
        Query query = getQuery(sql, params, pager.getPage(), pager.getLimit());
        pager.setTotal(this.getTotalBySql(sql, params));
        pager.setDataList(query.getResultList());
        return pager;
    }

    /**
     * 分页列表查询
     *
     * @param sql
     * @param params
     * @param page
     * @param limit
     * @return 返回list对象
     */
    @Override
    public <T> List<T> findListBySql(StringBuilder sql, List<Object> params, int page, int limit) {
        Query query = getQuery(sql, params, page, limit);
        return query.getResultList();
    }

    /**
     * 列表查询
     *
     * @param sql
     * @param params
     * @return 返回list对象
     */
    @Override
    public <T> List<T> findListBySql(StringBuilder sql, List<Object> params, Class<T> clazz) {
        List<Map<String, Object>> listMap = this.findListBySql(sql, params, 0, 0);
        List<T> list = new ArrayList<>();
        for (Map<String, Object> map : listMap) {
            T t = CommonUtils.mapToObject(map, clazz);
            list.add(t);
        }
        return list;
    }

    /**
     * 分页列表查询
     *
     * @param sql
     * @param params
     * @param page
     * @param limit
     * @return 返回listMap对象
     */
    @Override
    public List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params, int page, int limit) {
        return this.findListBySql(sql, params, page, limit);
    }

    /**
     * 列表查询
     *
     * @param sql
     * @param params
     * @return 返回listMap对象
     */
    @Override
    public List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params) {
        return this.findListBySql(sql, params, 0, 0);
    }

    /**
     * 获取记录总数
     *
     * @param sql
     * @param params
     * @return 返回记录数
     */
    @Override
    public Integer getTotalBySql(StringBuilder sql, List<Object> params) {
        String sqlString = "SELECT COUNT(1) total FROM ( " + sql + " ) t";
        Query query = entityManager.createNativeQuery(sqlString);
        for (int i = 0; i < params.size(); i++) {
            query.setParameter(i + 1, params.get(i));
        }
        Object singleResult = query.getSingleResult();
        if (singleResult instanceof BigInteger) {
            return ((BigInteger) singleResult).intValue();
        } else {
            return null;
        }
    }

    /**
     * 获取Query对象
     *
     * @param sql
     * @param params
     * @param page
     * @param limit
     * @return
     */
    @NotNull
    private Query getQuery(StringBuilder sql, List<Object> params, int page, int limit) {
        Query query = entityManager.createNativeQuery(String.valueOf(sql));
        for (int i = 0; i < params.size(); i++) {
            query.setParameter(i + 1, params.get(i));
        }
        if (page > 0 && limit > 0) {
            //起始数
            query.setFirstResult((page - 1) * limit);
            query.setMaxResults(limit);
        }
        query.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        return query;
    }
}
