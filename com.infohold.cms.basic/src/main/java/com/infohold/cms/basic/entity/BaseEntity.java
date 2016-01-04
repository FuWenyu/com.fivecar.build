package com.infohold.cms.basic.entity;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class BaseEntity implements Serializable{

	private static final long serialVersionUID = 71991941966345995L;
	
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
