package com.infohold.cms.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * 客户查询信息反馈对象
 * @author Administrator
 *
 */
public class QueryCustListResponseDTO {

	/**
	 * 公共信息
	 */
	private TransactionStatus transactionStatus;
	
	/**
	 * 客户信息集合
	 */
	List<CustInfoItem> CustList = new ArrayList<CustInfoItem>();
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;

	public TransactionStatus getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(TransactionStatus transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public List<CustInfoItem> getCustList() {
		return CustList;
	}

	public void setCustList(List<CustInfoItem> custList) {
		CustList = custList;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
