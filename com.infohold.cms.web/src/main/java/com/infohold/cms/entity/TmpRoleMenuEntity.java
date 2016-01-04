package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 角色菜单临时表
 * @author wanglei
 *
 */
@Entity
@Table(name = "tmp_role_menu")
public class TmpRoleMenuEntity extends BaseEntity {

	private static final long serialVersionUID = 8862453198654476481L;
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id", strategy = "uuid")
	@Column(name = "id", length = 128)
	private String id;
	
	@Id
	@Column(name = "role_code", length = 32)
	private String role_code;
	
	@Column(name = "role_name", length = 256)
	private String role_name;
	
	@Id
	@Column(name = "menu_id", length = 32)
	private String menu_id;
	
	@Column(name = "bsid", length = 32)
	private String bsid;
	
	@Column(name = "menu_name", length = 256)
	private String menu_name;
	
	@Column(name = "menu_url", length = 256)
	private String menu_url;

	@Column(name = "menu_pid", length = 32)
	private String menu_pid;

	public String getRole_code() {
		return role_code;
	}

	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	

	

	public String getBsid() {
		return bsid;
	}

	public void setBsid(String bsid) {
		this.bsid = bsid;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_url() {
		return menu_url;
	}

	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}

	public String getMenu_pid() {
		return menu_pid;
	}

	public void setMenu_pid(String menu_pid) {
		this.menu_pid = menu_pid;
	}
	
	
	
}
