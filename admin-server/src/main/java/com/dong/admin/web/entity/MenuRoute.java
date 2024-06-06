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

	private static final long serialVersionUID = 8922990668179753982L;


	/**
	 * 主键
	 */
	private String id;

	/**
	 * 菜单ID
	 */
	private String menuId;

	/**
	 * 路由名称
	 */
	private String name;

	/**
	 * 是否隐藏  0：不隐藏、1：隐藏
	 */
	private Boolean hidden;

	/**
	 * 是否总是显示  0：不显示、1：显示
	 */
	private Boolean alwaysShow;

	/**
	 * 页面布局
	 */
	private String component;

	/**
	 * 重定向路径
	 */
	private String redirect;

	/**
	 * 页面角色
	 */
	private String roles;

	/**
	 * 页面权限
	 */
	private String permission;

	/**
	 * 高亮的路径
	 */
	private String activeMenu;

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

 	@Column(name = "menu_id" )
	public String getMenuId() {
		return this.menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

 	@Column(name = "name" )
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

 	@Column(name = "hidden" )
	public Boolean getHidden() {
		return this.hidden;
	}

	public void setHidden(Boolean hidden) {
		this.hidden = hidden;
	}

 	@Column(name = "always_show" )
	public Boolean getAlwaysShow() {
		return this.alwaysShow;
	}

	public void setAlwaysShow(Boolean alwaysShow) {
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

 	@Column(name = "activeMenu" )
	public String getActiveMenu() {
		return this.activeMenu;
	}

	public void setActiveMenu(String activeMenu) {
		this.activeMenu = activeMenu;
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
