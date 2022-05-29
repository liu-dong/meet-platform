package com.dong.billingservice.web.dao.impl;

import com.dong.billingservice.web.dao.CommonDao;
import com.dong.billingservice.web.model.Pager;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

@Repository
public class CommonDaoImpl implements CommonDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public <T> Pager<T> findListBySql(Pager<T> pager, StringBuilder sql, List<Object> params) {
        Query query = entityManager.createNativeQuery(String.valueOf(sql));
        for (int i = 0; i < params.size(); i++) {
            query.setParameter(i + 1, params.get(i));
        }
        if (pager.getPage() > 0 && pager.getLimit() > 0) {
            query.setFirstResult((pager.getPage() - 1) * pager.getLimit());//起始数
            query.setMaxResults(pager.getLimit());
        }
        query.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        pager.setTotal(this.getTotalBySql(sql, params));
        pager.setDataList(query.getResultList());
        return pager;
    }

    @Override
    public <T> List<T> findListBySql(StringBuilder sql, List<Object> params, int page, int limit) {
        Query query = entityManager.createNativeQuery(String.valueOf(sql));
        for (int i = 0; i < params.size(); i++) {
            query.setParameter(i + 1, params.get(i));
        }
        if (page > 0 && limit > 0) {
            query.setFirstResult((page - 1) * limit);//起始数
            query.setMaxResults(limit);
        }
        query.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        return query.getResultList();
    }

    @Override
    public <T> List<T> findListBySql(StringBuilder sql, List<Object> params) {
        return this.findListBySql(sql, params, 0, 0);
    }


    @Override
    public List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params, int page, int limit) {
        return this.findListBySql(sql, params, page, limit);
    }

    @Override
    public List<Map<String, Object>> findListMapBySql(StringBuilder sql, List<Object> params) {
        return this.findListBySql(sql, params, 0, 0);
    }


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
}
