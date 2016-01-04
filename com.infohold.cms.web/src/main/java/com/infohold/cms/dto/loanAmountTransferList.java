package com.infohold.cms.dto;

public class loanAmountTransferList {
	/**
	 *    支付金额
	 */
	private String  transferAmount;
	
	/**
	 *     收款人类别
	 */
	private String   transferAccountType;
	
	/**
	 *     转账方式
	 */
	private String    transferMode;
	
	/**
	 *     收款人账号
	 */
	private String    transferAccountCode;
	
	/**
	 *    收款人名称
	 */
	private String     transferAccountName;
	
	/**
	 *    收款行联行号
	 */
	private String      transferBankCode;
	
	/**
	 *    收款行名全称
	 */
	private String       transferBankName;
	
	/**
	 *    支付状态
	 */
	private String       transferStatus;
	
	/**
	 *     摘要
	 */
	private String        transferNarrative;

	public String getTransferAmount() {
		return transferAmount;
	}

	public void setTransferAmount(String transferAmount) {
		this.transferAmount = transferAmount;
	}

	public String getTransferAccountType() {
		return transferAccountType;
	}

	public void setTransferAccountType(String transferAccountType) {
		this.transferAccountType = transferAccountType;
	}

	public String getTransferMode() {
		return transferMode;
	}

	public void setTransferMode(String transferMode) {
		this.transferMode = transferMode;
	}

	public String getTransferAccountCode() {
		return transferAccountCode;
	}

	public void setTransferAccountCode(String transferAccountCode) {
		this.transferAccountCode = transferAccountCode;
	}

	public String getTransferAccountName() {
		return transferAccountName;
	}

	public void setTransferAccountName(String transferAccountName) {
		this.transferAccountName = transferAccountName;
	}

	public String getTransferBankCode() {
		return transferBankCode;
	}

	public void setTransferBankCode(String transferBankCode) {
		this.transferBankCode = transferBankCode;
	}

	public String getTransferBankName() {
		return transferBankName;
	}

	public void setTransferBankName(String transferBankName) {
		this.transferBankName = transferBankName;
	}

	public String getTransferStatus() {
		return transferStatus;
	}

	public void setTransferStatus(String transferStatus) {
		this.transferStatus = transferStatus;
	}

	public String getTransferNarrative() {
		return transferNarrative;
	}

	public void setTransferNarrative(String transferNarrative) {
		this.transferNarrative = transferNarrative;
	}
	
	
}
