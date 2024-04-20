package com.dong.demo.es.dao;

import com.dong.demo.es.domain.BlogModel;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudong
 * @date 2023/5/6
 */
@Repository
public interface BlogRepository extends ElasticsearchRepository<BlogModel, String> {


    List<BlogModel> findByTitleLike(String title);
}
