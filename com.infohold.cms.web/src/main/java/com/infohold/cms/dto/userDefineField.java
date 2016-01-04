package com.infohold.cms.dto;

public class userDefineField {
	/**
	 *   用户自定义属性
	 */
	private String   userDefineFieldName;
	
	/**
	 *    用户自定义值
	 */
	private String    userDefineFieldValue;

	public String getUserDefineFieldName() {
		return userDefineFieldName;
	}

	public void setUserDefineFieldName(String userDefineFieldName) {
		this.userDefineFieldName = userDefineFieldName;
	}

	public String getUserDefineFieldValue() {
		return userDefineFieldValue;
	}

	public void setUserDefineFieldValue(String userDefineFieldValue) {
		this.userDefineFieldValue = userDefineFieldValue;
	}
	
	
}
