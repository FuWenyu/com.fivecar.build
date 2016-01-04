package com.infohold.cms.dto;

public class loanPayAccountList {
	/**
	 *    序号
	 */
	private String  serialNum;
	
	/**
	 *    还款账号类别
	 */
	private String   payAccountType;
	
	/**
	 *     还款账号
	 */
	private String    payAccount;

	public String getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}

	public String getPayAccountType() {
		return payAccountType;
	}

	public void setPayAccountType(String payAccountType) {
		this.payAccountType = payAccountType;
	}

	public String getPayAccount() {
		return payAccount;
	}

	public void setPayAccount(String payAccount) {
		this.payAccount = payAccount;
	}
	
	
}
