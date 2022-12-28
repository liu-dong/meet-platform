package com.dong.adminserver.web.model;

import lombok.Data;

/**
 * 角色权限信息
 *
 * @author Lenovo
 */
@Data
public class RolePermissionInfoBean {
    private String id;//
    private String roleId;//角色id
    private String permissionId;//权限id

}