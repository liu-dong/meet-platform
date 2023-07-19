package com.dong.fileserver.dao;

import com.dong.fileserver.entity.CommonAttachment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author liudong
 * @date 2023/7/19
 */
@Repository
public interface CommonAttachmentJpaDao extends JpaRepository<CommonAttachment, String> {
}
