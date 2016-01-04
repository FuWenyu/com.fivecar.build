package com.infohold.cms.dto;

/**
 * 借据详情查询接口返回
 * @author wangshouye
 *
 */
public class LoanRepaymentResponseDTO {

	/**
	 * 公共信息
	 */
	private TransactionStatus transactionStatus;

	public TransactionStatus getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(TransactionStatus transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	
	
}
