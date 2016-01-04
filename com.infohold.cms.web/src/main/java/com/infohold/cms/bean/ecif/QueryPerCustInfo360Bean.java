package com.infohold.cms.bean.ecif;


public class QueryPerCustInfo360Bean {

	private CommonBean commondata;
	private String loginId;  
	private String type;
	private String oldPwd;  
	private String newPwd;
	public CommonBean getCommondata() {
		return commondata;
	}
	public void setCommondata(CommonBean commondata) {
		this.commondata = commondata;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	
}
