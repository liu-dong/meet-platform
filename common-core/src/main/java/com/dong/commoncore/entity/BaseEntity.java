package com.dong.commoncore.entity;

import org.apache.commons.lang.StringUtils;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import java.util.Date;
import java.util.UUID;

/**
 * @author LD 2022/1/17
 */
public class BaseEntity {

    private String id;
    private String createUserId;
    private Date createTime;
    private String updateUserId;
    private Date updateTime;


    @PrePersist
    public void prePersist() {
        if (StringUtils.isBlank(this.id)) {
            this.setId(UUID.randomUUID().toString());
        }
        if (this.getUpdateTime() == null) {
            this.setUpdateTime(new Date());
        }
        if (this.getCreateTime() == null) {
            this.setCreateTime(new Date());
        }
    }

    @PreUpdate
    public void preUpdate() {
        if (this.getCreateTime() == null) {
            this.setCreateTime(new Date());
        }
        this.setUpdateTime(new Date());
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Basic
    @Column(name = "create_time", nullable = false)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }

    @Basic
    @Column(name = "update_time", nullable = true)
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
