package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 角色用户信息临时表
 * @author wanglei
 *
 */
@Entity
@Table(name = "tmp_role_user")
public class TmpRoleUserEntity extends BaseEntity {

	private static final long serialVersionUID = 8862453198654476481L;
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id", strategy = "uuid")
	@Column(name = "id", length = 32)
	private String id;
	@Id
	@Column(name = "role_code", length = 32)
	private String role_code;
	
	@Column(name = "role_name", length = 256)
	private String role_name;
	
	@Id
	@Column(name = "user_id", length = 32)
	private String user_id;
	
	@Column(name = "user_name", length = 256)
	private String user_name;
	
	@Column(name = "banch_no", length = 32)
	private String banch_no;
	
	@Column(name = "bsid", length = 32)
	private String bsid;

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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBanch_no() {
		return banch_no;
	}

	public void setBanch_no(String banch_no) {
		this.banch_no = banch_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBsid() {
		return bsid;
	}

	public void setBsid(String bsid) {
		this.bsid = bsid;
	}
	
	
	
}
