package com.dong.adminserver.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 菜单表
 *
 * @author liudong 2022/12/28
 */
@Entity
@Table(name = "sys_menu")
public class Menu implements Serializable {

    private static final long serialVersionUID = 4002849361189584074L;


    /**
     * 主键
     */
    private String id;

    /**
     * 上级菜单ID
     */
    private String parentId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 菜单所在的层级
     */
    private Integer menuLevel;

    /**
     * 小图标样式
     */
    private String menuIcon;

    /**
     * 菜单显示顺序
     */
    private Integer menuSort;

    /**
     * 路由名称
     */
    private String routeName;

    /**
     * 路由路径
     */
    private String routePath;

    /**
     * 菜单状态 0：不显示、1：显示
     */
    private Integer menuStatus;

    /**
     * 是否有子菜单 0：无 1：有
     */
    private Integer hasChild;

    private Date createTime;

    private Date updateTime;

    @Id
    @Column(name = "id")
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "parent_id")
    public String getParentId() {
        return this.parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    @Column(name = "menu_name")
    public String getMenuName() {
        return this.menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    @Column(name = "menu_level")
    public Integer getMenuLevel() {
        return this.menuLevel;
    }

    public void setMenuLevel(Integer menuLevel) {
        this.menuLevel = menuLevel;
    }

    @Column(name = "menu_icon")
    public String getMenuIcon() {
        return this.menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }

    @Column(name = "menu_sort")
    public Integer getMenuSort() {
        return this.menuSort;
    }

    public void setMenuSort(Integer menuSort) {
        this.menuSort = menuSort;
    }

    @Column(name = "route_name")
    public String getRouteName() {
        return this.routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    @Column(name = "route_path")
    public String getRoutePath() {
        return this.routePath;
    }

    public void setRoutePath(String routePath) {
        this.routePath = routePath;
    }

    @Column(name = "menu_status")
    public Integer getMenuStatus() {
        return this.menuStatus;
    }

    public void setMenuStatus(Integer menuStatus) {
        this.menuStatus = menuStatus;
    }

    @Column(name = "has_child")
    public Integer getHasChild() {
        return this.hasChild;
    }

    public void setHasChild(Integer hasChild) {
        this.hasChild = hasChild;
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
