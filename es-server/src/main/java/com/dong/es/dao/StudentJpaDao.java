package com.dong.es.dao;

import com.dong.es.domain.Student;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

/**
 * @author liudong
 * @date 2023/5/6
 */
@Repository
public interface StudentJpaDao extends ElasticsearchRepository<Student, String> {

}
