package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;
 
/**
 * 机构信息表
 * @author ZhangHongChao
 *
 */
@Entity
@Table(name = "auth_organization")
public class OrganizationEntity extends BaseEntity{
	
	private static final long serialVersionUID = -7517855445724931771L;

	@Id
	@Column(name = "ID", length = 32)
	private String id;
	
	@Column(name = "NAME", length = 32)
	private String name;
	
	@Column(name = "PID", length = 32)
	private String pid;

	@Column(name = "orgid", length = 32)
	private String orgid;

	@Column(name = "orgtype", length = 2)
	private String orgtype;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getOrgtype() {
		return orgtype;
	}

	public void setOrgtype(String orgtype) {
		this.orgtype = orgtype;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
