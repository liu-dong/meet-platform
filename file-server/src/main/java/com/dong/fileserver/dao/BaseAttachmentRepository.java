package com.dong.fileserver.dao;

import com.dong.commoncore.entity.BaseAttachmentEntityEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

/**
 * @author liudong
 * @date 2023/7/19
 */
@NoRepositoryBean
public interface BaseAttachmentRepository<E extends BaseAttachmentEntityEntity> extends JpaRepository<E, String> {

    List<E> findByRelationIdAndDeleteStatus(String relationId, Integer deleteStatus);

    List<E> findByRelationModule(String relationModule);
}
