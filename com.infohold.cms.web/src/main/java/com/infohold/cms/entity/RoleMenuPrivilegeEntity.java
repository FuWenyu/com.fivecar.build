package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import com.infohold.cms.basic.entity.BaseEntity;

@Entity
@Table(name="auth_role_menu_privilege")
public class RoleMenuPrivilegeEntity extends BaseEntity {

	private static final long serialVersionUID = -6507970106007179059L;

	@Id
	@Column(name="ROLEID", length=32)
	private String roleId;
	
	@Id
	@Column(name="MENUID", length=32)
	private String menuId;
	
	@Id
	@Column(name="PRIVILEGEID", length=32)
	private String privilegeId;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getPrivilegeId() {
		return privilegeId;
	}

	public void setPrivilegeId(String privilegeId) {
		this.privilegeId = privilegeId;
	}
	
}
