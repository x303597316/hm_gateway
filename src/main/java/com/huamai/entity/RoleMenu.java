package com.huamai.entity;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name="sys_role_menu")
public class RoleMenu extends BaseEntity{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer roleId;

    private Integer menuId;


    @Column(name="role_id")
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    @Column(name="menu_id")
    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }
}