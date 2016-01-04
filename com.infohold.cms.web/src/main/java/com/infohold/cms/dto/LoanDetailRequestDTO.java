package com.infohold.cms.dto;

import java.util.ArrayList;
import java.util.List;

public class LoanDetailRequestDTO {
	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	/**
	 * 流水号
	 */
	private String dueCode;


	public SessionContext getSessionContext() {
		return sessionContext;
	}


	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}


	public String getDueCode() {
		return dueCode;
	}


	public void setDueCode(String dueCode) {
		this.dueCode = dueCode;
	}
	
	
	
}