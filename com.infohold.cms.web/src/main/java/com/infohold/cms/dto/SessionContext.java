package com.infohold.cms.dto;

/**
 * 公共报文信息
 * @author Administrator
 *
 */
public class SessionContext {

	/**
	 * 银行代码
	 */
	private String bankCode;
	
	/**
	 * 外围系统编号
	 */
	private String extCode;
	
	/**
	 * 交易机构代码
	 */
	private String transactionBranch;
	
	/**
	 * 交易员编号
	 */
	private String userId;
	
	/**
	 * 授权人编号
	 */
	private String superId;
	
	/**
	 * 外围系统流水号
	 */
	private String userReferenceNumber;
	
	/**
	 * 业务流水号
	 */
	private String globaReferenceNumber;
	
	/**
	 * 交易时间
	 */
	private String transactionTime;
	
	/**
	 * 交易附言
	 */
	private String naration;
	
	/**
	 * 渠道
	 */
	private String channel;
	
	/**
	 * 条线代码
	 */
	private String appCode;

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getExtCode() {
		return extCode;
	}

	public void setExtCode(String extCode) {
		this.extCode = extCode;
	}

	public String getTransactionBranch() {
		return transactionBranch;
	}

	public void setTransactionBranch(String transactionBranch) {
		this.transactionBranch = transactionBranch;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSuperId() {
		return superId;
	}

	public void setSuperId(String superId) {
		this.superId = superId;
	}

	public String getUserReferenceNumber() {
		return userReferenceNumber;
	}

	public void setUserReferenceNumber(String userReferenceNumber) {
		this.userReferenceNumber = userReferenceNumber;
	}

	public String getGlobaReferenceNumber() {
		return globaReferenceNumber;
	}

	public void setGlobaReferenceNumber(String globaReferenceNumber) {
		this.globaReferenceNumber = globaReferenceNumber;
	}

	public String getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(String transactionTime) {
		this.transactionTime = transactionTime;
	}

	public String getNaration() {
		return naration;
	}

	public void setNaration(String naration) {
		this.naration = naration;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getAppCode() {
		return appCode;
	}

	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}
	
}
