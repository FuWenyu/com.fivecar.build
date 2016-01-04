package com.infohold.cms.dto;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;

/**
 * 个人客户DTO
 * @author wanglei
 *
 */
public class CustPersonInfoDTO {

	/**
	 * 客户编号
	 */
	private String custid;

	/**
	 * 姓名
	 */
	private String custname;

	/**
	 * 主办客户经理
	 */
	private String hostingmanager;

	/**
	 * 证件类型
	 */
	private String zjlx;

	/**
	 * 证件号码
	 */
	private String zjhm;

	/**
	 * 国籍
	 */
	private String country;

	/**
	 * 性别
	 */
	private String xb;

	/**
	 * 出生日期
	 */
	private String csrq;

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getHostingmanager() {
		return hostingmanager;
	}

	public void setHostingmanager(String hostingmanager) {
		this.hostingmanager = hostingmanager;
	}

	public String getZjlx() {
		return zjlx;
	}

	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}

	public String getZjhm() {
		return zjhm;
	}

	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getCsrq() {
		return csrq;
	}

	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	
	public String check() {
        Method[] methods = this.getClass().getMethods();
        for (int i = 0; i < methods.length; i++) {
            Method method = methods[i];
            if (method.getName().startsWith("get") && !method.getName().equals("getClass")) {
                try {
                    if(StringUtils.isBlank((String)method.invoke(this))){
                        return method.getName().substring(3);
                    }
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
	
}
