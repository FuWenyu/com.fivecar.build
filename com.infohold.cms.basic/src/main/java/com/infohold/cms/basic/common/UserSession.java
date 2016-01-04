package com.infohold.cms.basic.common;

import java.util.List;

/**
 * 
 * 描述: 用户SESSION信息
 * @author yangyantao
 */
public class UserSession {

	/**
	 * 用户主键ID
	 */
	private String userId;
	
	/**
	 * 用户登录ID
	 */
	private String loginId;
	
	/**
	 * 用户名称
	 */
	private String userName;

	/**
	 * 机构号
	 */
	private String branchNo;
	
	/**
	 * 机构名称
	 */
	private String branchName;
	
	/**
	 * 会计日期
	 */
	private String accDate;
	
	/**
	 * 用户状态  0未签到；1签到；2签离    （已作废）
	 */
	private String userStatus;
	
	/**
	 * 用户角色信息
	 */
	private List<UserRole> userRoleList;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(String branchNo) {
		this.branchNo = branchNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public List<UserRole> getUserRoleList() {
		return userRoleList;
	}

	public void setUserRoleList(List<UserRole> userRoleList) {
		this.userRoleList = userRoleList;
	}

	public String getAccDate() {
		return accDate;
	}

	public void setAccDate(String accDate) {
		this.accDate = accDate;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	
}
