package com.infohold.cms.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 用户和角色关系表
 * @author ZhangHongChao
 *
 */
@Entity
@Table(name = "auth_user_role")
public class UserRoleEntity extends BaseEntity {

	private static final long serialVersionUID = 8862453198654476481L;

	@Id
	@Column(name = "USERID", length = 32)
	private String userid;
	
	@Id
	@Column(name = "ROLEID", length = 32)
	private String roleid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	
}
