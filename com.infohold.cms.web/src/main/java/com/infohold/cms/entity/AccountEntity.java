package com.infohold.cms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 用户帐号表
 * @author fwy
 */


@Entity
@Table(name="fc_account")	
public class AccountEntity extends BaseEntity{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "account_id")
	private String account_id;
	
	@Column(name = "account_no")
	private String account_no;
	
	@Column(name = "password")
	private String password;
	


}
