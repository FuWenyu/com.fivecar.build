package com.infohold.cms.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 版本表
 * @author wag
 *
 */
@Entity
@Table(name = "auth_version")
public class VersionEntity extends BaseEntity {

	private static final long serialVersionUID = 8862453198654476481L;

	@Id
	@Column(name = "version_id", length = 8)
	private String version_id;

	@Column(name = "version_no", length = 8)
	private String version_no;
	
	@Column(name = "version_desc", length = 256)
	private String version_desc;

	@Column(name = "version_url", length = 256)
	private String version_url;

	@Column(name = "version_date", length = 19)
	private Timestamp version_date;
	
	@Column(name = "version_flag", length = 8)
	private String version_flag;
	
	@Column(name = "version_online", length = 1)
	private String version_online;
	
	@Column(name = "version_rsv1", length = 64)
	private String version_rsv1;
	
	@Column(name = "version_rsv2", length = 64)
	private String version_rsv2;
	
	@Column(name = "version_rsv3", length = 64)
	private String version_rsv3;
	
	@Column(name = "version_rsv4", length = 64)
	private String version_rsv4;
	
	@Column(name = "version_rsv5", length = 64)
	private String version_rsv5;

	public String getVersion_id() {
		return version_id;
	}

	public void setVersion_id(String version_id) {
		this.version_id = version_id;
	}

	public String getVersion_no() {
		return version_no;
	}

	public void setVersion_no(String version_no) {
		this.version_no = version_no;
	}

	public String getVersion_desc() {
		return version_desc;
	}

	public void setVersion_desc(String version_desc) {
		this.version_desc = version_desc;
	}



	public String getVersion_url() {
		return version_url;
	}

	public void setVersion_url(String version_url) {
		this.version_url = version_url;
	}

	public Timestamp getVersion_date() {
		return version_date;
	}

	public void setVersion_date(Timestamp version_date) {
		this.version_date = version_date;
	}

	public String getVersion_flag() {
		return version_flag;
	}

	public void setVersion_flag(String version_flag) {
		this.version_flag = version_flag;
	}

	public String getVersion_online() {
		return version_online;
	}

	public void setVersion_online(String version_online) {
		this.version_online = version_online;
	}

	public String getVersion_rsv1() {
		return version_rsv1;
	}

	public void setVersion_rsv1(String version_rsv1) {
		this.version_rsv1 = version_rsv1;
	}

	public String getVersion_rsv2() {
		return version_rsv2;
	}

	public void setVersion_rsv2(String version_rsv2) {
		this.version_rsv2 = version_rsv2;
	}

	public String getVersion_rsv3() {
		return version_rsv3;
	}

	public void setVersion_rsv3(String version_rsv3) {
		this.version_rsv3 = version_rsv3;
	}

	public String getVersion_rsv4() {
		return version_rsv4;
	}

	public void setVersion_rsv4(String version_rsv4) {
		this.version_rsv4 = version_rsv4;
	}

	public String getVersion_rsv5() {
		return version_rsv5;
	}

	public void setVersion_rsv5(String version_rsv5) {
		this.version_rsv5 = version_rsv5;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
