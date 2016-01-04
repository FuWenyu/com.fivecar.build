package com.infohold.cms.dto;

/**
 * 
 * @author Administrator
 *
 */
public class PageInfo {

	/**
	 * 第几页
	 */
	private String pageNo;
	
	/**
	 * 每页条数
	 */
	private String pageCount;
	
	/**
	 * 总条数
	 */
	private String totalCount;

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

}
