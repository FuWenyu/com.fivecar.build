package com.infohold.cms.basic.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

@Entity
@Table(name = "sys_sequence_cfg")
public class SysSequenceCfgEntity extends BaseEntity{

	private static final long serialVersionUID = -8172855983024187430L;
	
	@Id
	@Column(name = "key_",length=32)
	private String key;
	
	@Column(name = "name_",length=64)
	private String name;
	
	@Column(name = "value_",length=32)
	private String value;
	
	@Column(name = "ps",length=128)
	private String ps;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getPs() {
		return ps;
	}

	public void setPs(String ps) {
		this.ps = ps;
	}

}
