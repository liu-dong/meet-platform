package com.dong.productservice.es.dao;

import com.dong.productservice.es.entity.ESProduct;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ESProductJpaDao extends ElasticsearchRepository<ESProduct, String> {

    ESProduct getByProductName(String productName);
}
