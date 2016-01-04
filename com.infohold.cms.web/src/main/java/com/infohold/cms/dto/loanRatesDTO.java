package com.infohold.cms.dto;

public class loanRatesDTO {
	/**
	 * 基准利率获取方式
	 */
	private String  baseRateType;
	
	/**
	 *  基准利率代码
	 */
	private String    baseRateCode;
	
	/**
	 *   基准利率值
	 */
	private String     baseRateValue;
	
	/**
	 *    执行利率计算方式
	 */
	private String     regularRateType;
	
	/**
	 *    执行利率变动方式
	 */
	private String    regularRateChangeType;
	
	/**
	 *    执行利率变动系数
	 */
	private String     regularRateChangeValue;
	
	/**
	 *     执行利率
	 */
	private String      regularRateValue;
	
	/**
	 *     逾期利率变动方式
	 */
	private String      penaltyRateChangeType;
	
	/**
	 *      逾期利率变动系数
	 */
	private String      penaltyRateChangeValue;
	
	/**
	 *       逾期利率
	 */
	private String       penaltyRateValue;
	
	/**
	 *       挪用利率变动方式
	 */
	private String       divertRateChangeType;
	
	/**
	 *        挪用利率变动系数
	 */
	private String        divertRateChangeValue;
	
	/**
	 *       挪用利率
	 */
	private String        divertRateValue;
	

	/**
	 *        利率调整生效时间
	 */
	private String         loanRateRepricingRevision;
	
	/**
	 *        复利标志
	 */
	private String          compoundInterestCollectFlag;

	public String getBaseRateType() {
		return baseRateType;
	}

	public void setBaseRateType(String baseRateType) {
		this.baseRateType = baseRateType;
	}

	public String getBaseRateCode() {
		return baseRateCode;
	}

	public void setBaseRateCode(String baseRateCode) {
		this.baseRateCode = baseRateCode;
	}

	public String getBaseRateValue() {
		return baseRateValue;
	}

	public void setBaseRateValue(String baseRateValue) {
		this.baseRateValue = baseRateValue;
	}

	public String getRegularRateType() {
		return regularRateType;
	}

	public void setRegularRateType(String regularRateType) {
		this.regularRateType = regularRateType;
	}

	public String getRegularRateChangeType() {
		return regularRateChangeType;
	}

	public void setRegularRateChangeType(String regularRateChangeType) {
		this.regularRateChangeType = regularRateChangeType;
	}

	public String getRegularRateChangeValue() {
		return regularRateChangeValue;
	}

	public void setRegularRateChangeValue(String regularRateChangeValue) {
		this.regularRateChangeValue = regularRateChangeValue;
	}

	public String getRegularRateValue() {
		return regularRateValue;
	}

	public void setRegularRateValue(String regularRateValue) {
		this.regularRateValue = regularRateValue;
	}

	public String getPenaltyRateChangeType() {
		return penaltyRateChangeType;
	}

	public void setPenaltyRateChangeType(String penaltyRateChangeType) {
		this.penaltyRateChangeType = penaltyRateChangeType;
	}

	public String getPenaltyRateChangeValue() {
		return penaltyRateChangeValue;
	}

	public void setPenaltyRateChangeValue(String penaltyRateChangeValue) {
		this.penaltyRateChangeValue = penaltyRateChangeValue;
	}

	public String getPenaltyRateValue() {
		return penaltyRateValue;
	}

	public void setPenaltyRateValue(String penaltyRateValue) {
		this.penaltyRateValue = penaltyRateValue;
	}

	public String getDivertRateChangeType() {
		return divertRateChangeType;
	}

	public void setDivertRateChangeType(String divertRateChangeType) {
		this.divertRateChangeType = divertRateChangeType;
	}

	public String getDivertRateChangeValue() {
		return divertRateChangeValue;
	}

	public void setDivertRateChangeValue(String divertRateChangeValue) {
		this.divertRateChangeValue = divertRateChangeValue;
	}

	public String getDivertRateValue() {
		return divertRateValue;
	}

	public void setDivertRateValue(String divertRateValue) {
		this.divertRateValue = divertRateValue;
	}

	public String getLoanRateRepricingRevision() {
		return loanRateRepricingRevision;
	}

	public void setLoanRateRepricingRevision(String loanRateRepricingRevision) {
		this.loanRateRepricingRevision = loanRateRepricingRevision;
	}

	public String getCompoundInterestCollectFlag() {
		return compoundInterestCollectFlag;
	}

	public void setCompoundInterestCollectFlag(String compoundInterestCollectFlag) {
		this.compoundInterestCollectFlag = compoundInterestCollectFlag;
	}
	
	
}
