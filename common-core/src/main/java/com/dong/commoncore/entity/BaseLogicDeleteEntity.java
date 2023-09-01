package com.dong.commoncore.entity;

import com.dong.commoncore.constant.CommonConstant;
import com.dong.commoncore.util.CommonUtils;
import com.dong.commoncore.util.CurrentUserUtils;

import javax.persistence.Column;
import java.util.Date;

/**
 * 逻辑删除实体类通用字段(包含逻辑删除)
 *
 * @author liudong
 * @date 2023/7/20
 */
public class BaseLogicDeleteEntity extends BaseEntity {

    @Column(name = "delete_status")
    private Integer deleteStatus;

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
            this.setDeleteStatus(CommonConstant.NO);
        }
    }

    public void prePersist() {
        super.prePersist();
        if (this.getDeleteStatus() == null) {
            this.setDeleteStatus(CommonConstant.NO);
        }
    }

    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
}
