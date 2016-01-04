package com.infohold.cms.dto;

/**
 * 借据详情查询接口返回
 * @author wangshouye
 *
 */
public class LoanDetailResponseDTO {

	/**
	 * 公共信息
	 */
	private TransactionStatus transactionStatus;
	
	/**
	 * 放款日期
	 */
	private String loandisbursementDate;
	
	/**
	 * 借据余额
	 */
	private String loanBalance;
	
	/**
	 * 已还本金
	 */
	private String repaidPrincipal;
	
	/**
	 * 已还利息
	 */
	private String repaidInterest;
	
	/**
	 * 手续费金额
	 */
	private String loanFeesAmount;
	
	/**
	 * 产品代码
	 */
	private String productCode;
	
	/**
	 * 循环标志
	 */
	private String loanCycleFlag;
	
	/**
	 * 贷款用途
	 */
	private String loanPurpose;
	
	/**
	 * 委托协议编号
	 */
	private String entrustedCode;
	
	/**
	 * 贷款期限
	 */
	private String loanTerm;
	
	/**
	 * 贷款到期日期
	 */
	private String loanMaturityDate;
	
	/**
	 * 还款方式
	 */
	private String loanScheduleCode;
	
	/**
	 * 自动放款标识
	 */
	private String loanAutoDisbursementFlag;
	
	/**
	 * 放款模式
	 */
	private String loanDisbursementMode;
	
	/**
	 * 放款账号
	 */
	private String loanDisbursementAccount;
	
	/**
	 * 主要担保方式
	 */
	private String loanGuaType;
	
	/**
	 * 利率信息
	 */
	private loanRatesDTO loanRatesDTO;

	/**
	 * 还款账号数组[]
	 */
	private loanPayAccountList loanPayAccountList;
	
	/**
	 * 贷款转账清单数组[]
	 */
	private loanAmountTransferList loanAmountTransferList;

	/**
	 * 用户自定义信息数组[]
	 */
	private userDefineField userDefineField;

	public TransactionStatus getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(TransactionStatus transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public String getLoandisbursementDate() {
		return loandisbursementDate;
	}

	public void setLoandisbursementDate(String loandisbursementDate) {
		this.loandisbursementDate = loandisbursementDate;
	}

	public String getLoanBalance() {
		return loanBalance;
	}

	public void setLoanBalance(String loanBalance) {
		this.loanBalance = loanBalance;
	}

	public String getRepaidPrincipal() {
		return repaidPrincipal;
	}

	public void setRepaidPrincipal(String repaidPrincipal) {
		this.repaidPrincipal = repaidPrincipal;
	}

	public String getRepaidInterest() {
		return repaidInterest;
	}

	public void setRepaidInterest(String repaidInterest) {
		this.repaidInterest = repaidInterest;
	}

	public String getLoanFeesAmount() {
		return loanFeesAmount;
	}

	public void setLoanFeesAmount(String loanFeesAmount) {
		this.loanFeesAmount = loanFeesAmount;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getLoanCycleFlag() {
		return loanCycleFlag;
	}

	public void setLoanCycleFlag(String loanCycleFlag) {
		this.loanCycleFlag = loanCycleFlag;
	}

	public String getLoanPurpose() {
		return loanPurpose;
	}

	public void setLoanPurpose(String loanPurpose) {
		this.loanPurpose = loanPurpose;
	}

	public String getEntrustedCode() {
		return entrustedCode;
	}

	public void setEntrustedCode(String entrustedCode) {
		this.entrustedCode = entrustedCode;
	}

	public String getLoanTerm() {
		return loanTerm;
	}

	public void setLoanTerm(String loanTerm) {
		this.loanTerm = loanTerm;
	}

	public String getLoanMaturityDate() {
		return loanMaturityDate;
	}

	public void setLoanMaturityDate(String loanMaturityDate) {
		this.loanMaturityDate = loanMaturityDate;
	}

	public String getLoanScheduleCode() {
		return loanScheduleCode;
	}

	public void setLoanScheduleCode(String loanScheduleCode) {
		this.loanScheduleCode = loanScheduleCode;
	}

	public String getLoanAutoDisbursementFlag() {
		return loanAutoDisbursementFlag;
	}

	public void setLoanAutoDisbursementFlag(String loanAutoDisbursementFlag) {
		this.loanAutoDisbursementFlag = loanAutoDisbursementFlag;
	}

	public String getLoanDisbursementMode() {
		return loanDisbursementMode;
	}

	public void setLoanDisbursementMode(String loanDisbursementMode) {
		this.loanDisbursementMode = loanDisbursementMode;
	}

	public String getLoanDisbursementAccount() {
		return loanDisbursementAccount;
	}

	public void setLoanDisbursementAccount(String loanDisbursementAccount) {
		this.loanDisbursementAccount = loanDisbursementAccount;
	}

	public String getLoanGuaType() {
		return loanGuaType;
	}

	public void setLoanGuaType(String loanGuaType) {
		this.loanGuaType = loanGuaType;
	}

	public loanRatesDTO getLoanRatesDTO() {
		return loanRatesDTO;
	}

	public void setLoanRatesDTO(loanRatesDTO loanRatesDTO) {
		this.loanRatesDTO = loanRatesDTO;
	}

	public loanPayAccountList getLoanPayAccountList() {
		return loanPayAccountList;
	}

	public void setLoanPayAccountList(loanPayAccountList loanPayAccountList) {
		this.loanPayAccountList = loanPayAccountList;
	}

	public loanAmountTransferList getLoanAmountTransferList() {
		return loanAmountTransferList;
	}

	public void setLoanAmountTransferList(
			loanAmountTransferList loanAmountTransferList) {
		this.loanAmountTransferList = loanAmountTransferList;
	}

	public userDefineField getUserDefineField() {
		return userDefineField;
	}

	public void setUserDefineField(userDefineField userDefineField) {
		this.userDefineField = userDefineField;
	}

}
