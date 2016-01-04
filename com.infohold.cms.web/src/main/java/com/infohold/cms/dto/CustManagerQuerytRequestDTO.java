package com.infohold.cms.dto;

/**
 * 客户经理查询请求对象
 * @author wanglei
 *
 */
public class CustManagerQuerytRequestDTO {

	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	private String custManagerId;
	
	private String custManagerName;
	
	public SessionContext getSessionContext() {
		return sessionContext;
	}

	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}

	public String getCustManagerId() {
		return custManagerId;
	}

	public void setCustManagerId(String custManagerId) {
		this.custManagerId = custManagerId;
	}

	public String getCustManagerName() {
		return custManagerName;
	}

	public void setCustManagerName(String custManagerName) {
		this.custManagerName = custManagerName;
	}

}
