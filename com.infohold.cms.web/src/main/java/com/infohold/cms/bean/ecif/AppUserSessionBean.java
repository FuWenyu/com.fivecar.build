package com.infohold.cms.bean.ecif;

public class AppUserSessionBean {
	// 登录状态（临时字段，调试用），0：未登录，1：已登录
	private String loginstatus;

	// 用户id
	private int cust_id;

	// 客户类型。1个人；2企业
	private String cust_type;

	// 登录名
	private String login_name;

	// 办公所在地省编码
	private int province_code;

	// 办公所在地市编码
	private int city_code;

	// 认证名称
	private String cert_name;

	public String getLoginstatus() {
		return loginstatus;
	}

	public void setLoginstatus(String loginstatus) {
		this.loginstatus = loginstatus;
	}

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_type() {
		return cust_type;
	}

	public void setCust_type(String cust_type) {
		this.cust_type = cust_type;
	}

	public String getLogin_name() {
		return login_name;
	}

	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	public int getProvince_code() {
		return province_code;
	}

	public void setProvince_code(int province_code) {
		this.province_code = province_code;
	}

	public int getCity_code() {
		return city_code;
	}

	public void setCity_code(int city_code) {
		this.city_code = city_code;
	}

	public String getCert_name() {
		return cert_name;
	}

	public void setCert_name(String cert_name) {
		this.cert_name = cert_name;
	}
}
