package com.infohold.cms.dto;

/**
 * 客户查询信息请求对象
 * @author Administrator
 *
 */
public class QueryCustListRequestDTO {

	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	/**
	 * 客户经理编号
	 */
	private String managerId;
	
	/**
	 * 客户编号
	 */
	private String custId;
	
	/**
	 * 客户名称
	 */
	private String custName;
	
	/**
	 * 文件类型
	 */
	private String doctype;
	
	/**
	 * 文件编号
	 */
	private String docNo;

	/**
	 * 客户类型
	 */
	private String custType;
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;

	public SessionContext getSessionContext() {
		return sessionContext;
	}

	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getDoctype() {
		return doctype;
	}

	public void setDoctype(String doctype) {
		this.doctype = doctype;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
