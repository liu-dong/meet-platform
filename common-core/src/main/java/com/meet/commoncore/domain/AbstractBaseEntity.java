package com.meet.commoncore.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@MappedSuperclass
public abstract class AbstractBaseEntity implements BaseEntityAttribute, Serializable {

    private static final long serialVersionUID = 1L;


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

    public AbstractBaseEntity() {

    }

    protected String id;

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
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "create_user_id")
    public String getCreateUserId() {
        return this.createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "update_time")
    public Date getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Column(name = "update_user_id")
    public String getUpdateUserId() {
        return this.updateUserId;
    }

    public void setUpdateUserId(String updateUserId) {
        this.updateUserId = updateUserId;
    }


    @Override
    public String toString() {
        return String.format("Entity of type %s with id: %s", this.getClass()
                .getName(), getId());
    }

    @Override
    public boolean equals(Object obj) {
        if (null == obj) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!getClass().equals(obj.getClass())) {
            return false;
        }
        AbstractBaseEntity that = (AbstractBaseEntity) obj;
        return this.getId() != null && this.getId().equals(that.getId());
    }

    @Override
    public int hashCode() {
        int hashCode = 17;
        hashCode += null == getId() ? 0 : getId().hashCode() * 31;
        return hashCode;
    }
}
