package com.dong.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 用户角色表
 *
 * @author liudong 2022/12/28
 */
@Entity
@Table(name = "sys_account_role")
public class AccountRole implements Serializable {

    private static final long serialVersionUID = 6758397654847496889L;


    private String id;

    /**
     * 用户id
     */
    private String accountId;

    /**
     * 角色id
     */
    private String roleId;

    @Id
    @Column(name = "id")
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "account_id")
    public String getAccountId() {
        return this.accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    @Column(name = "role_id")
    public String getRoleId() {
        return this.roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

}
