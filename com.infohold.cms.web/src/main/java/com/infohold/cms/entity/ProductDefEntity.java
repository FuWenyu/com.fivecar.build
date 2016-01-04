package com.infohold.cms.entity;


import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 产品定义
 * @author Administrator
 *
 */
@Entity
@Table(name = "pub_product_def")
public class ProductDefEntity extends BaseEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1976614189691878876L;

	//产品编码
	@Id
	@Column(name = "pro_code", length = 32)
	private String pro_code;
	
	//产品名称
	@Column(name = "pro_name", length = 32)
	private String pro_name;
	
	//产品类型。1企业；2个人
	@Column(name = "pro_type", length = 8)
	private String pro_type;

	//币种
	@Column(name = "cny", length = 8)
	private String cny;
	
	//担保方式
	@Column(name = "guarantee_type", length = 32)
	private String guarantee_type;
	
	//放款方式
	@Column(name = "rep_way", length = 32)
	private String rep_way;
	
	//状态
	@Column(name = "status", length = 32)
	private String status;
	
	//展期标志。0否；1是
	@Column(name = "postpone_flag", length = 1)
	private String postpone_flag;
	
	//担保变更标志。0否；1是
	@Column(name = "guaranteechange_flag", length = 1)
	private String guaranteechange_flag;
	
	//产品描述
	@Column(name = "ps", length = 32)
	private String ps;
	
	//创建时间
	@Column(name = "create_date")
	private Date create_date;
	
	//更新时间
	@Column(name = "update_date")
	private Date update_date;

	//贷款类型。1:定期贷款   2:循环贷款
	@Column(name = "loan_type")
	private String loan_type;
	
	public String getLoan_type() {
		return loan_type;
	}

	public void setLoan_type(String loan_type) {
		this.loan_type = loan_type;
	}

	public String getPro_code() {
		return pro_code;
	}

	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_type() {
		return pro_type;
	}

	public void setPro_type(String pro_type) {
		this.pro_type = pro_type;
	}

	public String getCny() {
		return cny;
	}

	public void setCny(String cny) {
		this.cny = cny;
	}

	public String getGuarantee_type() {
		return guarantee_type;
	}

	public void setGuarantee_type(String guarantee_type) {
		this.guarantee_type = guarantee_type;
	}

	public String getRep_way() {
		return rep_way;
	}

	public void setRep_way(String rep_way) {
		this.rep_way = rep_way;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPostpone_flag() {
		return postpone_flag;
	}

	public void setPostpone_flag(String postpone_flag) {
		this.postpone_flag = postpone_flag;
	}

	public String getGuaranteechange_flag() {
		return guaranteechange_flag;
	}

	public void setGuaranteechange_flag(String guaranteechange_flag) {
		this.guaranteechange_flag = guaranteechange_flag;
	}

	public String getPs() {
		return ps;
	}

	public void setPs(String ps) {
		this.ps = ps;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	
	
}
