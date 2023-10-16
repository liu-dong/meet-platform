package com.dong.security.core.model.vo;

import lombok.Data;

import java.util.Date;

/**
 * 权限信息
 *
 * @author liudong
 */
@Data
public class PermissionVO {
    private String id;//
    private String parentId;//
    private String permissionCode;//权限编码
    private String permissionName;//权限名称
    private String permissionType;//权限类型  0：页面权限、1：操作权限、2：数据权限
    private String resourceId;//资源id(菜单表id)
    private Date createTime;//
    private Date updateTime;//

}
