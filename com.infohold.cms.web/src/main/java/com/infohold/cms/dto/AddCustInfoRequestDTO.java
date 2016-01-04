package com.infohold.cms.dto;

/**
 * 客户新增请求对象
 * @author wanglei
 *
 */
public class AddCustInfoRequestDTO {

	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	/**
	 * 客户类型：1-公司  2-个人
	 */
	private String custType;
	
	/**
	 * 企业客户
	 */
	private CustCorporateInfoDTO custCorporateInfoDTO = new CustCorporateInfoDTO();
	
	/**
	 * 个人客户
	 */
	private CustPersonInfoDTO custPersonInfoDTO = new CustPersonInfoDTO();

	public SessionContext getSessionContext() {
		return sessionContext;
	}

	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}

	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
	}

	public CustCorporateInfoDTO getCustCorporateInfoDTO() {
		return custCorporateInfoDTO;
	}

	public void setCustCorporateInfoDTO(CustCorporateInfoDTO custCorporateInfoDTO) {
		this.custCorporateInfoDTO = custCorporateInfoDTO;
	}

	public CustPersonInfoDTO getCustPersonInfoDTO() {
		return custPersonInfoDTO;
	}

	public void setCustPersonInfoDTO(CustPersonInfoDTO custPersonInfoDTO) {
		this.custPersonInfoDTO = custPersonInfoDTO;
	}
	
}
