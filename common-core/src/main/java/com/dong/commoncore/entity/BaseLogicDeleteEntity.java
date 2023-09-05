package com.dong.commoncore.entity;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.CurrentUserUtils;

import javax.persistence.Column;
import javax.persistence.PrePersist;
import java.util.Date;

/**
 * 逻辑删除实体类通用字段(包含逻辑删除)
 *
 * @author liudong
 * @date 2023/7/20
 */
public abstract class BaseLogicDeleteEntity extends BaseEntity {

    /**
     * 删除状态：0 未删除、1 已删除
     */
    protected Integer deleteStatus;

    public BaseLogicDeleteEntity() {

    }

    public BaseLogicDeleteEntity(boolean initDefault) {
        if (initDefault) {
            this.setId(CommonUtils.getUUID());
            this.setUpdateTime(new Date());
            this.setCreateTime(new Date());
            if (CurrentUserUtils.currentUser() != null) {
                this.setCreateUserId(CurrentUserUtils.getUserId());
                this.setUpdateUserId(CurrentUserUtils.getUserId());
            }
            this.setDeleteStatus(CommonConstant.YES);
        }
    }

    @PrePersist
    @Override
    public void prePersist() {
        super.prePersist();
        if (this.getDeleteStatus() == null) {
            this.setDeleteStatus(CommonConstant.YES);
        }
    }

    @Column(name = "delete_status")
    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
}
