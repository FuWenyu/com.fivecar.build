package com.infohold.cms.basic.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.infohold.cms.basic.entity.BaseEntity;

/**
 * 异常信息表
 *
 */
@Entity
@Table(name = "biz_exception")
public class BizExceptionEntity extends BaseEntity{
	
	private static final long serialVersionUID = -8686747262375952867L;
	
	@Id
	@Column(name = "exp_id", length = 11)
	private int exp_id;
		
	//异常码
	@Column(name = "exp_code", length = 32)
	private String exp_code;
	
	//异常信息
	@Column(name = "exp_msg", length = 512)
	private String exp_msg;	
	
	//异常处理人员
	@Column(name = "oper_id", length = 11)
	private int oper_id;	
	
	//业务ID
	@Column(name = "biz_id", length = 11)
	private int biz_id;	
	
	//交易码
	@Column(name = "trade_code", length = 11)
	private String trade_code;
	
	//交易类型
	@Column(name = "trade_name", length = 11)
	private String trade_name;
		
	//异常处理状态。0未处理；1已处理
	@Column(name = "status", length = 11)
	private String status;
	
	//异常产生日期
	@Column(name = "create_date", length = 11)
	private Date create_date;
	
	//异常产生时间
	@Column(name = "create_time", length = 11)
	private Date create_time;	
	
	//异常处理日期
	@Column(name = "update_date", length = 11)
	private Date update_date;
	
	//异常处理时间
	@Column(name = "update_time", length = 11)
	private Date update_time;

	public int getExp_id() {
		return exp_id;
	}

	public void setExp_id(int exp_id) {
		this.exp_id = exp_id;
	}

	public String getExp_code() {
		return exp_code;
	}

	public void setExp_code(String exp_code) {
		this.exp_code = exp_code;
	}

	public String getExp_msg() {
		return exp_msg;
	}

	public void setExp_msg(String exp_msg) {
		this.exp_msg = exp_msg;
	}

	public int getOper_id() {
		return oper_id;
	}

	public void setOper_id(int oper_id) {
		this.oper_id = oper_id;
	}

	public int getBiz_id() {
		return biz_id;
	}

	public void setBiz_id(int biz_id) {
		this.biz_id = biz_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getTrade_code() {
		return trade_code;
	}

	public void setTrade_code(String trade_code) {
		this.trade_code = trade_code;
	}

	public String getTrade_name() {
		return trade_name;
	}

	public void setTrade_name(String trade_name) {
		this.trade_name = trade_name;
	}	

}
