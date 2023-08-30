package com.dong.es.dao;

import com.dong.es.domain.BlogModel;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudong
 * @date 2023/5/6
 */
@Repository
public interface BlogJpaDao extends ElasticsearchRepository<BlogModel, String> {


    List<BlogModel> findByTitleLike(String title);
}
