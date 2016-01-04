package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 角色菜单关系表
 * @author wanglei
 *
 */
@Entity
@Table(name = "auth_role_menu")
public class RoleMenuEntity extends BaseEntity {

	private static final long serialVersionUID = 8862453198654476481L;

	@Id
	@Column(name = "ROLEID", length = 32)
	private String roleid;
	
	@Id
	@Column(name = "MENUID", length = 32)
	private String menuid;

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
}
