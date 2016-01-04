package com.infohold.cms.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * 客户经理查询反馈对象
 * @author wanglei
 *
 */
public class CustManagerQuerytResponsetDTO {

	/**
	 * 公共信息
	 */
	private TransactionStatus transactionStatus;
	
	private List<CustManagerItem> custManagerList = new ArrayList<CustManagerItem>();
	
	
	public List<CustManagerItem> getCustManagerList() {
		return custManagerList;
	}

	public void setCustManagerList(List<CustManagerItem> custManagerList) {
		this.custManagerList = custManagerList;
	}

	public TransactionStatus getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(TransactionStatus transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
}
