package com.infohold.cms.basic.exception;

/**
 * 
 * 描述:自定义业务异常
 * @author yangyantao
 */
public class BusinessException extends RuntimeException {

	private static final long serialVersionUID = 3283896062056897453L;

	/**
	 * 异常码
	 */
	private String expCode="";
	
	/**
	 * 扩展的异常描述文字
	 */
	private String expMsg="";
	
	public BusinessException() {
		super();
	}
	
	public BusinessException(String expCode) {
		this.setExpCode(expCode);
	}
	
	public BusinessException(String expCode,String expMsg) {
		this.setExpCode(expCode);
		this.setExpMsg(expMsg);
	}
	
	public BusinessException(Throwable cause) {
		super(cause);
	}
	
	public BusinessException(String expCode, Throwable cause) {
		super(expCode, cause);
		this.setExpCode(expCode);
	}
	
	public String getExpCode() {
		return expCode;
	}

	public void setExpCode(String expCode) {
		this.expCode = expCode;
	}

	public String getExpMsg() {
		return expMsg;
	}

	public void setExpMsg(String expMsg) {
		this.expMsg = expMsg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
