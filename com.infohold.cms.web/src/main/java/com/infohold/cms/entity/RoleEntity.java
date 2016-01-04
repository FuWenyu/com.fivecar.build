package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 角色表
 * @author wanglei
 *
 */
@Entity
@Table(name = "auth_role")
public class RoleEntity extends BaseEntity{
	
	private static final long serialVersionUID = -6328575723388090920L;

	@Id
	@Column(name = "id", length = 32)
	private String id;
	
	@Column(name = "name", length = 32)
	private String name;
	
	@Column(name = "role_type", length = 16)
	private String role_type;
	
	@Column(name = "role_code", length = 16)
	private String role_code;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole_type() {
		return role_type;
	}

	public void setRole_type(String role_type) {
		this.role_type = role_type;
	}

	public String getRole_code() {
		return role_code;
	}

	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	

}
