package com.dong.securitycore.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * 角色权限表
 *
 * @author liudong 2022/12/28
 */
@Entity
@Table(name = "sys_role_permission")
public class RolePermission implements Serializable {

    private static final long serialVersionUID = 4267818816897413439L;


    private String id;

    /**
     * 角色id
     */
    private String roleId;

    /**
     * 权限id
     */
    private String permissionId;

    @Id
    @Column(name = "id")
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "role_id")
    public String getRoleId() {
        return this.roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Column(name = "permission_id")
    public String getPermissionId() {
        return this.permissionId;
    }

    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId;
    }

}
