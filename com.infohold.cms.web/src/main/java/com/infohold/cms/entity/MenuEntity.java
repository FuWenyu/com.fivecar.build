package com.infohold.cms.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 菜单表
 * @author wanglei
 *
 */
@Entity
@Table(name = "auth_menu")
public class MenuEntity extends BaseEntity{

	private static final long serialVersionUID = -8686747262375952867L;
	@Id
	@Column(name = "ID", length = 32)
	private String id;
	
	@Column(name = "NAME", length = 32)
	private String name;
	
	@Column(name = "PID", length = 32)
	private String pid;
	
	@Column(name = "URL", length = 256)
	private String url;
	
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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
