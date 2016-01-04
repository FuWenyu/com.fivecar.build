package com.infohold.cms.dto;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.apache.commons.lang.StringUtils;

/**
 * 企业客户DTO
 * @author wanglei
 *
 */
public class CustCorporateInfoDTO {
	
	/**
	 * 客户编号
	 */
	private String custid;
	
	/**
	 * 中文全称
	 */
	private String custchname;
	
	/**
	 * 外文全称
	 */
	private String custenname;

	/**
	 * 客户简称
	 */
	private String custshortname;

	/**
	 * 国籍
	 */
	private String country;
	
	/**
	 * 营销客户经理
	 */
	private String seller;

	/**
	 * 主办客户经理
	 */
	private String hostingmanager;

	/**
	 * 文件种类
	 */
	private String doctype;

	/**
	 * 文件编号
	 */
	private String docno;

	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getCustchname() {
		return custchname;
	}

	public void setCustchname(String custchname) {
		this.custchname = custchname;
	}

	public String getCustenname() {
		return custenname;
	}

	public void setCustenname(String custenname) {
		this.custenname = custenname;
	}

	public String getCustshortname() {
		return custshortname;
	}

	public void setCustshortname(String custshortname) {
		this.custshortname = custshortname;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getHostingmanager() {
		return hostingmanager;
	}

	public void setHostingmanager(String hostingmanager) {
		this.hostingmanager = hostingmanager;
	}

	public String getDoctype() {
		return doctype;
	}

	public void setDoctype(String doctype) {
		this.doctype = doctype;
	}

	public String getDocno() {
		return docno;
	}

	public void setDocno(String docno) {
		this.docno = docno;
	}
	
	public String check() {
        Method[] methods = this.getClass().getMethods();
        for (int i = 0; i < methods.length; i++) {
            Method method = methods[i];
            if (method.getName().startsWith("get") 
            		&& !method.getName().equals("getClass")
            		&& !method.getName().equals("getCustshortname")//不检查客户简称
            		&& !method.getName().equals("getCustenname")//不检外文全称
            	) {
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
