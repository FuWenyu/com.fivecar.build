package com.infohold.cms.dto;

/**
 *客户新增反馈对象
 * @author wanglei
 *
 */
public class AddCustInfoResponseDTO {

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
