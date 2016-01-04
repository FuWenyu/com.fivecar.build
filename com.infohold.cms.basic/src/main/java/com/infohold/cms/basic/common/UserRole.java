package com.infohold.cms.basic.common;

/**
 * 
 * 描述: 用户角色对象
 */
public class UserRole {

	/**
	 * 角色ID
	 */
	private String role_id;
	
	/**
	 * 角色编号
	 */
	private String role_code;
	
	/**
	 * 角色名称
	 */
	private String role_name;

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_code() {
		return role_code;
	}

	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}

	
}
