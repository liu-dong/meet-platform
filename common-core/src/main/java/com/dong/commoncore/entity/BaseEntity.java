package com.dong.commoncore.entity;

import cn.hutool.core.util.StrUtil;
import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.CurrentUserUtils;
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
public class BaseEntity implements Serializable {

    /**
     * 主键id
     */
    @Id
    @Column(name = "id")
    protected String id;

    /**
     * 创建时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    protected Date createTime;

    /**
     * 创建人
     */
    @Column(name = "create_user_id")
    protected String createUserId;

    /**
     * 修改时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "update_time")
    protected Date updateTime;

    /**
     * 修改人
     */
    @Column(name = "update_user_id")
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
        if (StrUtil.isBlank(this.id)) {
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }
}
