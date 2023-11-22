package com.dong.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 单位人员表
 *
 * @author liudong 2022/12/28
 */
@Entity
@Table(name = "sys_org_person")
public class OrgPerson implements Serializable {

    private static final long serialVersionUID = 7993075334570655824L;


    /**
     * 主键
     */
    private String id;

    /**
     * 人员id
     */
    private String personId;

    /**
     * 单位id
     */
    private String orgId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改事件
     */
    private Date updateTime;

    @Id
    @Column(name = "id")
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "person_id")
    public String getPersonId() {
        return this.personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    @Column(name = "org_id")
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "create_time")
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "update_time")
    public Date getUpdateTime() {
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

}
