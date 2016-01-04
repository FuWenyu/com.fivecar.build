package com.infohold.cms.bean.ecif;

import com.infohold.cms.basic.common.Page;

public class CommonBean {

	// 登录用户信息
	private AppUserSessionBean regUserSession;

	// 列表分页信息
	private Page page;

	// 返回响应码，1代表成功，其余代表失败
	private String reCode;

	// 返回响应信息
	private String reMsg;

	public AppUserSessionBean getRegUserSession() {
		return regUserSession;
	}

	public void setRegUserSession(AppUserSessionBean regUserSession) {
		this.regUserSession = regUserSession;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getReCode() {
		return reCode;
	}

	public void setReCode(String reCode) {
		this.reCode = reCode;
	}

	public String getReMsg() {
		return reMsg;
	}

	public void setReMsg(String reMsg) {
		this.reMsg = reMsg;
	}
}
