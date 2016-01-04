package com.infohold.cms.bean.http;

public class LoginRequestBean {
	// 登录状态（临时字段，调试用），0：未登录，1：已登录
	private String loginstatus;

	// 用户名，手机号
	private String login_name;

	// 密码
	private int password;

	public String getLoginstatus() {
		return loginstatus;
	}

	public void setLoginstatus(String loginstatus) {
		this.loginstatus = loginstatus;
	}

	/**
	 * @return the login_name
	 */
	public String getLogin_name() {
		return login_name;
	}

	/**
	 * @param login_name the login_name to set
	 */
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	/**
	 * @return the password
	 */
	public int getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(int password) {
		this.password = password;
	}

}
