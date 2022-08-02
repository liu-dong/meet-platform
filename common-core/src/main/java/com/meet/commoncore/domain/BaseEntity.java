package com.meet.commoncore.domain;

import java.util.Date;

public interface BaseEntity {

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
