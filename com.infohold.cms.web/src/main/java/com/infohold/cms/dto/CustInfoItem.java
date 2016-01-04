package com.infohold.cms.dto;

/**
 * 客户信息项
 * @author Administrator
 *
 */
public class CustInfoItem {

	/**
	 * 客户编号
	 */
	private String custId;
	
	/**
	 * 客户名称
	 */
	private String custChName;
	
	/**
	 * 文件类型
	 */
	private String docType;
	
	/**
	 * 文件编号
	 */
	private String docNo;
	
	/**
	 * 维护日期
	 */
	private String updateDate;
	
	/**
	 * 主办客户经理姓名
	 */
	private String hostingmanagerName;
	
	/**
	 * 主办客户经理编号
	 */
	private String hostingmanager;
	
	/**
	 * 主办机构
	 */
	private String hostingOrg;

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustChName() {
		return custChName;
	}

	public void setCustChName(String custChName) {
		this.custChName = custChName;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getHostingmanagerName() {
		return hostingmanagerName;
	}

	public void setHostingmanagerName(String hostingmanagerName) {
		this.hostingmanagerName = hostingmanagerName;
	}

	public String getHostingmanager() {
		return hostingmanager;
	}

	public void setHostingmanager(String hostingmanager) {
		this.hostingmanager = hostingmanager;
	}

	public String getHostingOrg() {
		return hostingOrg;
	}

	public void setHostingOrg(String hostingOrg) {
		this.hostingOrg = hostingOrg;
	}
	
	
}
