package com.infohold.cms.dto;

/**
 * 客户新增请求对象
 * @author zhc
 *
 */
public class AddCustRequestDTO {

	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	/**
	 * 是否信贷客户
	 */
	private String isBankCriditCust;
	
	/**
	 * 返回码1成功0失败
	 */
	private String replyCode;
	
	/**
	 * 返回信息
	 */
	private String replyExp;
	
	/**
	 * 客户类型1 公司  2个人 
	 */
	private String custType;
	
	/**
	 * 企业客户
	 */
	private CustCorporateDTO custCorporateDTO;

	/**
	 * 个人客户
	 */
	private CustPersonDTO custPersonDTO;
	

	public SessionContext getSessionContext() {
		return sessionContext;
	}

	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}

	public String getIsBankCriditCust() {
		return isBankCriditCust;
	}

	public void setIsBankCriditCust(String isBankCriditCust) {
		this.isBankCriditCust = isBankCriditCust;
	}


	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
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

	public String getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
	}

	public String getReplyExp() {
		return replyExp;
	}

	public void setReplyExp(String replyExp) {
		this.replyExp = replyExp;
	}

}
