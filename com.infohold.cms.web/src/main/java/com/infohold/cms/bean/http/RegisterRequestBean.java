package com.infohold.cms.bean.http;

public class RegisterRequestBean {

	// 手机号
	private String phone_no;

	// 密码
	private String password;

	// 验证码
	private String vc_code;

	/**
	 * @return the phone_no
	 */
	public String getPhone_no() {
		return phone_no;
	}

	/**
	 * @param phone_no the phone_no to set
	 */
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the vc_code
	 */
	public String getVc_code() {
		return vc_code;
	}

	/**
	 * @param vc_code the vc_code to set
	 */
	public void setVc_code(String vc_code) {
		this.vc_code = vc_code;
	}

}
