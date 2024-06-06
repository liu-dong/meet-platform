package com.dong.admin.web.model.dto;

import com.dong.commoncore.model.ListConditionDTO;
import lombok.Data;

/**
 * @author LD
 * @date 2020/3/22 22:02
 */
@Data
public class MenuDTO extends ListConditionDTO {

    private String id;
    private String parentId;
    private String menuName;
    // 菜单级别（一级菜单、二级菜单）
    private Integer menuLevel;

    // 菜单图标
    private String menuIcon;

    // 菜单排序
    private Integer menuSort;

    // 菜单路径
    private String menuPath;

    // 路由名称
    private String routeName;

    // 路由路径
    private String routePath;

    // 菜单状态，是否显示
    private Integer menuStatus;

    // 是否有子菜单
    private Integer hasChild;

    /**
     * 如果设置为true，将始终显示根菜单
     * 如果没有设置alwaysShow且子路由数量超过一个时，
     * 它会变成嵌套模式，否则不显示根菜单
     */
    private boolean alwaysShow;

    /**
     * 如果设置了noRedirect，则在面包屑中不会重定向
     */
    private String redirect;

    /**
     * 页面布局（目前仅有Layout）
     */
    private String component = "Layout";

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
    private boolean breadcrumb = true;

    /**
     * 如果设置了路径，侧边栏将高亮你设置的路径
     */
    private String activeMenu;
}

