package com.dong.commoncore.domain;

import java.util.Date;

/**
 * 实体类通用属性
 *
 * @author liudong
 */
public interface BaseAttribute {

    String getId();

    void setId(String id);

    String getCreateUserId();

    void setCreateUserId(final String createUserId);

    Date getCreateTime();

    void setCreateTime(Date createdTime);

    String getUpdateUserId();

    void setUpdateUserId(final String updateUserId);

    Date getUpdateTime();

    void setUpdateTime(Date lastModifiedTime);
}
