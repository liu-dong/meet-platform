package com.dong.commoncore.entity;

import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.CurrentUserUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 自动填充实体类通用字段
 *
 * @author liudong
 */
@DynamicInsert
@DynamicUpdate
@MappedSuperclass
public abstract class BaseEntity implements Serializable {

    /**
     * 主键id
     */
    protected String id;

    /**
     * 创建时间
     */
    protected Date createTime;

    /**
     * 创建人
     */
    protected String createUserId;

    /**
     * 修改时间
     */
    protected Date updateTime;

    /**
     * 修改人
     */
    protected String updateUserId;

    public BaseEntity() {

    }

    public BaseEntity(boolean initDefault) {
        if (initDefault) {
            this.setId(CommonUtils.getUUID());
            this.setUpdateTime(new Date());
            this.setCreateTime(new Date());
            if (CurrentUserUtils.currentUser() != null) {
                this.setCreateUserId(CurrentUserUtils.getUserId());
                this.setUpdateUserId(CurrentUserUtils.getUserId());
            }
        }

    }

    @PrePersist
    public void prePersist() {
        if (StringUtils.isBlank(this.id)) {
            this.setId(CommonUtils.getUUID());
        }
        if (this.getUpdateTime() == null) {
            this.setUpdateTime(new Date());
        }
        if (this.getCreateTime() == null) {
            this.setCreateTime(new Date());
        }
        if (CurrentUserUtils.currentUser() != null) {
            this.setUpdateUserId(CurrentUserUtils.getUserId());
        }
    }

    @PreUpdate
    public void preUpdate() {
        if (this.getCreateTime() == null) {
            this.setCreateTime(new Date());
        }
        this.setUpdateTime(new Date());
        if (CurrentUserUtils.currentUser() != null) {
            this.setUpdateUserId(CurrentUserUtils.getUserId());
        }
    }

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "create_user_id")
    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "update_time")
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Column(name = "update_user_id")
    public String getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }
}
