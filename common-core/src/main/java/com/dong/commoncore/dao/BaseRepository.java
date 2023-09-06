package com.dong.commoncore.dao;

import com.dong.commoncore.entity.BaseLogicDeleteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

/**
 * @author liudong
 * @date 2023/9/6
 */
@NoRepositoryBean
public interface BaseRepository<T extends BaseLogicDeleteEntity, ID> extends JpaRepository<T, ID> {

    void logicDelete(ID id);

    void batchLogicDelete(List<ID> ids);
}
