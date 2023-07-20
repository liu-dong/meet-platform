package com.dong.fileserver.dao;

import com.dong.fileserver.entity.CommonAttachment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudong
 * @date 2023/7/19
 */
@Repository
public interface CommonAttachmentRepository extends JpaRepository<CommonAttachment, String> {

    List<CommonAttachment> findByRelationIdAndDeleteStatus(String relationId, Integer deleteStatus);

    List<CommonAttachment> findByRelationModule(String relationModule);
}
