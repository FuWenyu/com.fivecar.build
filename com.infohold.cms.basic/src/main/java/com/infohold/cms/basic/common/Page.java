package com.infohold.cms.basic.common;

import java.io.Serializable;

public class Page implements Serializable {

	private static final long serialVersionUID = -2120702005879016713L;

	private int pageSize = 8;
	
	private int pageNo = 1;
	
	private int totalCount;
	
	/**
	 * 总页数
	 */
	private int totalPages;

	public int getTotalPageCount() {
		if (totalCount % pageSize == 0)
			return totalCount / pageSize;
		else
			return totalCount / pageSize + 1;
	}

	public boolean isHasNextPage() {
		return pageNo < getTotalPageCount();
	}

	public boolean isHasPreviousPage() {
		return pageNo > 1;
	}

	public int getStartOfPage() {
		return (pageNo - 1) * pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

}
