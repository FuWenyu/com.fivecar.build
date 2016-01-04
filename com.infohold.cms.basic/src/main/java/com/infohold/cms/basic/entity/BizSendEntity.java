package com.infohold.cms.basic.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 描述：接口调用日志记录表
 */
@Entity
@Table(name="biz_send")
public class BizSendEntity extends BaseEntity{

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "flow_no", length = 128)
	private String flow_no; //流水号
	
	@Column(name = "tradeCode", length = 128)
	private String tradeCode;//交易码
	
	@Column(name = "tradeName", length = 128)
	private String tradeName;//交易名称

	@Column(name = "biz_id", length = 128)
	private String biz_id;//业务编号
	
	@Column(name = "sendTime", length = 32)
	private String sendTime;//申请时间
	
	@Column(name = "branch_no", length = 32)
	private String branch_no;//主办机构
	
	@Column(name = "cust_manager", length = 64)
	private String cust_manager;//主办客户经理
	
	@Column(name = "ps", length = 256)
	private String ps;//备注
	
	@Column(name = "group_id", length = 64)
	private String group_id;//分组ID，用于记录同一笔交易
	
	@Column(name = "send_status", length = 8)
	private String send_status;//状态1：成功 0：失败 
	
	@Column(name = "sq_no", length =4)
	private String sq_no;//序号
	
	@Column(name = "err_msg", length = 256)
	private String err_msg;//接口返回的错误信息

	public String getFlow_no() {
		return flow_no;
	}

	public void setFlow_no(String flow_no) {
		this.flow_no = flow_no;
	}

	public String getTradeCode() {
		return tradeCode;
	}

	public void setTradeCode(String tradeCode) {
		this.tradeCode = tradeCode;
	}

	public String getTradeName() {
		return tradeName;
	}

	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}

	public String getBiz_id() {
		return biz_id;
	}

	public void setBiz_id(String biz_id) {
		this.biz_id = biz_id;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getBranch_no() {
		return branch_no;
	}

	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
	}

	public String getCust_manager() {
		return cust_manager;
	}

	public void setCust_manager(String cust_manager) {
		this.cust_manager = cust_manager;
	}

	public String getPs() {
		return ps;
	}

	public void setPs(String ps) {
		this.ps = ps;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getSend_status() {
		return send_status;
	}

	public void setSend_status(String send_status) {
		this.send_status = send_status;
	}

	public String getSq_no() {
		return sq_no;
	}

	public void setSq_no(String sq_no) {
		this.sq_no = sq_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getErr_msg() {
		return err_msg;
	}

	public void setErr_msg(String err_msg) {
		this.err_msg = err_msg;
	}

	
}
