package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 机构信息临时表
 * @author wanglei
 *
 */
@Entity
@Table(name = "tmp_organization")
public class TmpOrganizationEntity extends BaseEntity {

	private static final long serialVersionUID = 8862453198654476481L;
	
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id", strategy = "uuid")
	@Column(name = "id", length = 128)
	private String id;
	
	@Column(name = "banch_no", length = 32)
	private String banch_no;
	
	@Column(name = "banch_name", length = 256)
	private String banch_name;
	
	@Column(name = "banch_p_no", length = 32)
	private String banch_p_no;
	
	@Column(name = "state", length = 32)
	private String state;

	public String getBanch_no() {
		return banch_no;
	}

	public void setBanch_no(String banch_no) {
		this.banch_no = banch_no;
	}

	public String getBanch_name() {
		return banch_name;
	}

	public void setBanch_name(String banch_name) {
		this.banch_name = banch_name;
	}

	public String getBanch_p_no() {
		return banch_p_no;
	}

	public void setBanch_p_no(String banch_p_no) {
		this.banch_p_no = banch_p_no;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
}
