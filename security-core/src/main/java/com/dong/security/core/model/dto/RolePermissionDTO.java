package com.dong.security.core.model.dto;

import lombok.Data;

/**
 * 角色权限信息
 *
 * @author liudong
 */
@Data
public class RolePermissionDTO {
    private String id;//
    private String roleId;//角色id
    private String permissionId;//权限id

}
