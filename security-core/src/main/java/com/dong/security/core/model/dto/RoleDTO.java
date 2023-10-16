package com.dong.security.core.model.dto;

import lombok.Data;

import java.util.List;

/**
 * 角色信息
 *
 * @author LD
 */
@Data
public class RoleDTO {
    private String id;//主键id
    private String roleCode;//角色编码
    private String roleName;//角色名称
    private String remark;//角色描述
    private String createTime;//创建时间
    private String updateTime;//修改时间
    private List<String> accountIdList;//账号id
    private List<String> permissionIdList;//权限id
    private String roleId;//角色id

}
