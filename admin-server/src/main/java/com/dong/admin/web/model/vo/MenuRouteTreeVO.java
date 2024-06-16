package com.dong.admin.web.model.vo;

import lombok.Data;

import java.util.List;

/**
 * @author LD
 * @date 2020/3/22 22:02
 */
@Data
public class MenuRouteTreeVO {

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
     * 菜单显示顺序
     */
    private Integer sort;

    /**
     * 是否有子菜单
     */
    private Integer hasChild;

    private Boolean hasChildren;

    /**
     * 如果设置为true，该项将不会在侧边栏中显示(默认是false)
     */
    private Integer hidden;


    /**
     * 显示在侧边栏和面包屑中的名称(推荐设置)
     */
    private String title;

    private List<MenuRouteTreeVO> children;


}

