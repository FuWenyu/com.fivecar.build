package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 用户表
 * @author wanglei
 *
 */
@Entity
@Table(name = "auth_user")
public class UserEntity extends BaseEntity {

	private static final long serialVersionUID = 8862453198654476481L;

	@Id
	@Column(name = "userid", length = 32)
	private String userid;

	@Column(name = "loginid", length = 32)
	private String loginid;
	
	@Column(name = "name", length = 32)
	private String name;

	@Column(name = "password", length = 32)
	private String password;

	@Column(name = "organizationid", length = 32)
	private String organizationid;
	
	@Column(name = "status", length = 16)
	private String status;
	
	@Column(name = "type", length = 1)
	private String type;
	
	public String getUserid() {
		return userid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOrganizationid() {
		return organizationid;
	}

	public void setOrganizationid(String organizationid) {
		this.organizationid = organizationid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	
}
