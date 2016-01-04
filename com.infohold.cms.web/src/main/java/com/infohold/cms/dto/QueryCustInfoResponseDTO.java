package com.infohold.cms.dto;

/**
 * 客户详情查询反馈对象
 * @author Administrator
 *
 */
public class QueryCustInfoResponseDTO {

	/**
	 * 公共信息
	 */
	private TransactionStatus transactionStatus;
	
	/**
	 * 企业客户
	 */
	private CustCorporateDTO custCorporateDTO;

	/**
	 * 个人客户
	 */
	private CustPersonDTO custPersonDTO;

	public TransactionStatus getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(TransactionStatus transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public CustCorporateDTO getCustCorporateDTO() {
		return custCorporateDTO;
	}

	public void setCustCorporateDTO(CustCorporateDTO custCorporateDTO) {
		this.custCorporateDTO = custCorporateDTO;
	}

	public CustPersonDTO getCustPersonDTO() {
		return custPersonDTO;
	}

	public void setCustPersonDTO(CustPersonDTO custPersonDTO) {
		this.custPersonDTO = custPersonDTO;
	}
	
	
}
