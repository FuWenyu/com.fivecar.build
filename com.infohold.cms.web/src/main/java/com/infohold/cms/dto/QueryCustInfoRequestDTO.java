package com.infohold.cms.dto;

/**
 * 客户详情查询请求对象
 * @author Administrator
 *
 */
public class QueryCustInfoRequestDTO {

	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	/**
	 * 客户编号
	 */
	private String custId;

	public SessionContext getSessionContext() {
		return sessionContext;
	}

	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	
}
