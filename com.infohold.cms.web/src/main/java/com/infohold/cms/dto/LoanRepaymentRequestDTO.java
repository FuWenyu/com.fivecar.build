package com.infohold.cms.dto;

import java.util.ArrayList;
import java.util.List;

public class LoanRepaymentRequestDTO {
	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	/**
	 * 借据
	 */
	private String dueCode;

	/**
	 * 还款类型
	 */
	private String payType;
	
	/**
	 * 是否强制结息
	 */
	private String settleInterestsFlag;
	
	/**
	 * 还款金额
	 */
	private String payAmount;
	
	/**
	 * 还款账号
	 */
	private String payAccount;
	
	/**
	 * 币种
	 */
	private String loanCurrency;
	
	/**
	 * 还款计划变更方式
	 */
	private String rescheduleType;

	public SessionContext getSessionContext() {
		return sessionContext;
	}

	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}

	public String getDueCode() {
		return dueCode;
	}

	public void setDueCode(String dueCode) {
		this.dueCode = dueCode;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getSettleInterestsFlag() {
		return settleInterestsFlag;
	}

	public void setSettleInterestsFlag(String settleInterestsFlag) {
		this.settleInterestsFlag = settleInterestsFlag;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}

	public String getPayAccount() {
		return payAccount;
	}

	public void setPayAccount(String payAccount) {
		this.payAccount = payAccount;
	}

	public String getLoanCurrency() {
		return loanCurrency;
	}

	public void setLoanCurrency(String loanCurrency) {
		this.loanCurrency = loanCurrency;
	}

	public String getRescheduleType() {
		return rescheduleType;
	}

	public void setRescheduleType(String rescheduleType) {
		this.rescheduleType = rescheduleType;
	}
	
	
}