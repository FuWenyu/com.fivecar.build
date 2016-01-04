package com.infohold.cms.dto;

/**
 * 放款接口信息反馈对象
 * @author wangshouye
 *
 */
public class LoanDisbursementAddResponseDTO {

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
