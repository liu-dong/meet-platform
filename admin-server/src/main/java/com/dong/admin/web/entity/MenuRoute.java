package com.dong.admin.web.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 菜单路由表
 *
 * @author liudong 2024/06/06
 */
@Entity
@Table (name = "sys_menu_route")
public class MenuRoute implements Serializable {

	private static final long serialVersionUID = 6715021842612159742L;


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
	private String title;

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
	 * 是否有子菜单 0：无 1：有
	 */
	private Integer hasChild;

	/**
	 * 是否隐藏  0：不隐藏、1：隐藏
	 */
	private Integer hidden;

	/**
	 * 是否总是显示  0：不显示、1：显示
	 */
	private Integer alwaysShow;

	/**
	 * 页面布局
	 */
	private String component;

	/**
	 * 重定向路径
	 */
	private String redirect;

	/**
	 * 高亮的路径
	 */
	private String activeMenu;

	/**
	 * 页面角色
	 */
	private String roles;

	/**
	 * 页面权限
	 */
	private String permission;

	private Date createTime;

	private Date updateTime;

	@Id
	@Column(name = "id" )
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "parent_id" )
	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "title" )
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "name" )
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "path" )
	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Column(name = "level" )
	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Column(name = "icon" )
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "sort" )
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(name = "has_child")
	public Integer getHasChild() {
		return this.hasChild;
	}

	public void setHasChild(Integer hasChild) {
		this.hasChild = hasChild;
	}

	@Column(name = "hidden" )
	public Integer getHidden() {
		return this.hidden;
	}

	public void setHidden(Integer hidden) {
		this.hidden = hidden;
	}

	@Column(name = "always_show" )
	public Integer getAlwaysShow() {
		return this.alwaysShow;
	}

	public void setAlwaysShow(Integer alwaysShow) {
		this.alwaysShow = alwaysShow;
	}

	@Column(name = "component" )
	public String getComponent() {
		return this.component;
	}

	public void setComponent(String component) {
		this.component = component;
	}

	@Column(name = "redirect" )
	public String getRedirect() {
		return this.redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	@Column(name = "active_menu" )
	public String getActiveMenu() {
		return this.activeMenu;
	}

	public void setActiveMenu(String activeMenu) {
		this.activeMenu = activeMenu;
	}

	@Column(name = "roles" )
	public String getRoles() {
		return this.roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	@Column(name = "permission" )
	public String getPermission() {
		return this.permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	@Column(name = "create_time" )
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "update_time" )
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
