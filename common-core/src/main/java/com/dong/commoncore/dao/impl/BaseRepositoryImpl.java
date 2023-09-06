package com.dong.commoncore.dao.impl;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.dao.BaseRepository;
import com.dong.commoncore.entity.BaseLogicDeleteEntity;

import java.util.List;

/**
 * @author liudong
 * @date 2023/9/6
 */
public abstract class BaseRepositoryImpl<T extends BaseLogicDeleteEntity, ID> implements BaseRepository<T, ID> {

    @Override
    public void logicDelete(ID id) {
        T entity = this.getReferenceById(id);
        entity.setDeleteStatus(CommonConstant.YES);
        this.save(entity);
    }

    @Override
    public void batchLogicDelete(List<ID> ids) {
        List<T> entityList = this.findAllById(ids);
        entityList.forEach(entity -> entity.setDeleteStatus(CommonConstant.YES));
        this.saveAll(entityList);
    }
}
