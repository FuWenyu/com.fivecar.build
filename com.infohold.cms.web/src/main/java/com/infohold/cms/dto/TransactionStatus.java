package com.infohold.cms.dto;

/**
 * 公共报文信息
 * @author Administrator
 */
public class TransactionStatus {

	/**
	 * 异常信息
	 */
	private String faultMessage;
	
	/**
	 * 错误代码
	 */
	private String errorCode;
	
	/**
	 * 错误消息
	 */
	private String errorMessage;
	
	/**
	 * 备注
	 */
	private String memo;
	
	/**
	 * 交易返回编号
	 */
	private String replyCode;
	
	/**
	 * 交易返回信息
	 */
	private String replyText;
	
	/**
	 * 客户端发送流水号
	 */
	private String userReferenceNumber;
	
	/**
	 * 主机返回流水号
	 */
	private String externalReferenceNo;

	public String getFaultMessage() {
		return faultMessage;
	}

	public void setFaultMessage(String faultMessage) {
		this.faultMessage = faultMessage;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public String getUserReferenceNumber() {
		return userReferenceNumber;
	}

	public void setUserReferenceNumber(String userReferenceNumber) {
		this.userReferenceNumber = userReferenceNumber;
	}

	public String getExternalReferenceNo() {
		return externalReferenceNo;
	}

	public void setExternalReferenceNo(String externalReferenceNo) {
		this.externalReferenceNo = externalReferenceNo;
	}
	
	
}
