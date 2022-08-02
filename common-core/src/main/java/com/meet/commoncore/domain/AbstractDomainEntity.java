package com.meet.commoncore.domain;

import cn.hutool.core.util.StrUtil;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import java.util.Date;
import java.util.UUID;

@DynamicInsert
@DynamicUpdate
@MappedSuperclass
public abstract class AbstractDomainEntity extends AbstractBaseEntity {

    public AbstractDomainEntity() {

    }

    public AbstractDomainEntity(boolean initDefault) {
        if (initDefault) {
            this.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            this.setUpdateTime(new Date());
            this.setCreateTime(new Date());
        }

    }

    @PrePersist
    public void prePersist() {
        if (StrUtil.isBlank(this.id)) {
            this.setId(UUID.randomUUID().toString().replaceAll("-", ""));
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
}
