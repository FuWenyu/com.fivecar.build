package com.infohold.cms.dto;

/**
 * 放款接口请求对象
 * @author wangshouye
 *
 */
public class LoanDisbursementAddRequestDTO {
	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	/**
	 * 发起审核时的流水号
	 */
	private String TranSeq;
	//放款审核结果。0审核不通过；1审核通过
	private String result;
	public SessionContext getSessionContext() {
		return sessionContext;
	}
	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}
	public String getTranSeq() {
		return TranSeq;
	}
	public void setTranSeq(String tranSeq) {
		TranSeq = tranSeq;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
}
