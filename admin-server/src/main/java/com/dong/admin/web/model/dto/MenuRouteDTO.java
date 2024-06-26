package com.dong.admin.web.model.dto;

import lombok.Data;

/**
 * 路由
 *
 * @author liudong 2024-06-06 09:28:05
 */
@Data
public class MenuRouteDTO {

    /**
     * 主键
     */
    private String id;

    /**
     * 上级菜单ID
     */
    private String parentId;

    /**
     * 路由名称
     */
    private String name;

    /**
     * 路由路径
     */
    private String path;

    /**
     * 菜单所在的层级
     */
    private Integer level;

    /**
     * 小图标样式
     */
    private String icon;

    /**
     * 菜单显示顺序
     */
    private Integer sort;

    /**
     * 是否有子菜单
     */
    private Integer hasChild;

    /**
     * 如果设置为true，该项将不会在侧边栏中显示(默认是false)
     */
    private Integer hidden;

    /**
     * 如果设置为true，将始终显示根菜单
     * 如果没有设置alwaysShow且子路由数量超过一个时，
     * 它会变成嵌套模式，否则不显示根菜单
     */
    private Integer alwaysShow;

    /**
     * 如果设置了noRedirect，则在面包屑中不会重定向
     */
    private String redirect;

    /**
     * 页面布局（目前仅有Layout）
     */
    private String component;

    /**
     * 控制页面角色(你可以设置多个角色)
     */
    private String roles;

    /**
     * 控制页面权限(每个菜单对应一个权限码)
     */
    private String permission;

    /**
     * 显示在侧边栏和面包屑中的名称(推荐设置)
     */
    private String title;

    /**
     * 如果设置为false，该项将隐藏在面包屑中(默认是true)
     */
    private Boolean breadcrumb = true;

    /**
     * 如果设置了路径，侧边栏将高亮你设置的路径
     */
    private String activeMenu;
}

