package com.infohold.cms.dto;

import java.util.ArrayList;
import java.util.List;

public class LoanAddRequestDTO {
	/**
	 * 公共信息
	 */
	private SessionContext sessionContext;
	
	
	/**
	 * 还款账号数组[]
	 */
	List<loanPayAccountList> loanPayAccountList = new ArrayList<loanPayAccountList>();
	
	/**
	 * 押品数组[]
	 */
	List<collateralList> collateralList = new ArrayList<collateralList>();
	
	/**
	 * 流水号
	 */
	private String TranSeq;
	
	/**
	 * 返回码1成功0失败
	 */
	private String replyCode;
	
	/**
	 * 返回信息
	 */
	private String replyExp;
	
	/**
	 * 起始日期
	 */
	private String startdate;
	
	/**
	 * 放款模式
	 */
	private String loanDisbursementMode;
	/**
	 * 放款账号
	 */
	private String loanDisbursementAccount;
	
	/**
	 *多个还款账号标识 
	 */
	private String multiPayAccountFlag;
	
	/**
	 * 还款账号扣收方式
	 */
	private String deductType;
	
	/**
	 *  还款账号
	 */
	private String hkzh;
	
	/**
	 * 贷款业务种类
	 */
	private String dkywzl;
	
	/**
	 * 贷款形式
	 */
	private String dkxs;
	
	/**
	 *贷款分类
	 */
	private String dkfl;
	/**
	 *贷款投向
	 */
	private String dktx;
	
	/**
	 *财政承诺范围
	 */
	private String czcnfw;
	
	/**
	 *龙头企业标志
	 */
	private String ltqybz;
	/**
	 *龙头企业等级
	 */
	private String ltqydj;
	/**
	 *房地产贷款类型
	 */
	private String fdcdklx;
	/**
	 *涉农贷款标识
	 */
	private String sndkbz;
	/**
	 *涉农贷款分类
	 */
	private String sndkfl;
	/**
	 *农业综合开发贷款标识
	 */
	private String nyzhkfdkbz;
	/**
	 *扶贫贴息贷款标识
	 */
	private String fptxdkbz;
	/**
	 *借款原因
	 */
	private String jkyy;
	/**
	 *借款其他原因
	 */
	private String jkqtyy;
	/**
	 *经营性贷款标识
	 */
	private String jyxdkbz;
	/**
	 *经营范围
	 */
	private String jyfw;
	/**
	 *企业征信贷款种类
	 */
	private String qyzxdkzl;
	/**
	 *是否银团标志
	 */
	private String sfyt;
	/**
	 *是否限制类行业
	 */
	private String sfxzlhy;
	/**
	 *行业分类
	 */
	private String hyfl;
	
	
	public SessionContext getSessionContext() {
		return sessionContext;
	}
	public void setSessionContext(SessionContext sessionContext) {
		this.sessionContext = sessionContext;
	}
	public List<loanPayAccountList> getLoanPayAccountList() {
		return loanPayAccountList;
	}
	public void setLoanPayAccountList(List<loanPayAccountList> loanPayAccountList) {
		this.loanPayAccountList = loanPayAccountList;
	}
	
	public List<collateralList> getCollateralList() {
		return collateralList;
	}
	public void setCollateralList(List<collateralList> collateralList) {
		this.collateralList = collateralList;
	}
	public String getTranSeq() {
		return TranSeq;
	}
	public void setTranSeq(String tranSeq) {
		TranSeq = tranSeq;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
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
	public String getMultiPayAccountFlag() {
		return multiPayAccountFlag;
	}
	public void setMultiPayAccountFlag(String multiPayAccountFlag) {
		this.multiPayAccountFlag = multiPayAccountFlag;
	}
	public String getDeductType() {
		return deductType;
	}
	public void setDeductType(String deductType) {
		this.deductType = deductType;
	}
	public String getHkzh() {
		return hkzh;
	}
	public void setHkzh(String hkzh) {
		this.hkzh = hkzh;
	}
	public String getDkywzl() {
		return dkywzl;
	}
	public void setDkywzl(String dkywzl) {
		this.dkywzl = dkywzl;
	}
	public String getDkxs() {
		return dkxs;
	}
	public void setDkxs(String dkxs) {
		this.dkxs = dkxs;
	}
	public String getDkfl() {
		return dkfl;
	}
	public void setDkfl(String dkfl) {
		this.dkfl = dkfl;
	}
	public String getDktx() {
		return dktx;
	}
	public void setDktx(String dktx) {
		this.dktx = dktx;
	}
	public String getCzcnfw() {
		return czcnfw;
	}
	public void setCzcnfw(String czcnfw) {
		this.czcnfw = czcnfw;
	}
	public String getLtqybz() {
		return ltqybz;
	}
	public void setLtqybz(String ltqybz) {
		this.ltqybz = ltqybz;
	}
	public String getLtqydj() {
		return ltqydj;
	}
	public void setLtqydj(String ltqydj) {
		this.ltqydj = ltqydj;
	}
	public String getFdcdklx() {
		return fdcdklx;
	}
	public void setFdcdklx(String fdcdklx) {
		this.fdcdklx = fdcdklx;
	}
	public String getSndkbz() {
		return sndkbz;
	}
	public void setSndkbz(String sndkbz) {
		this.sndkbz = sndkbz;
	}
	public String getSndkfl() {
		return sndkfl;
	}
	public void setSndkfl(String sndkfl) {
		this.sndkfl = sndkfl;
	}
	public String getNyzhkfdkbz() {
		return nyzhkfdkbz;
	}
	public void setNyzhkfdkbz(String nyzhkfdkbz) {
		this.nyzhkfdkbz = nyzhkfdkbz;
	}
	public String getFptxdkbz() {
		return fptxdkbz;
	}
	public void setFptxdkbz(String fptxdkbz) {
		this.fptxdkbz = fptxdkbz;
	}
	public String getJkyy() {
		return jkyy;
	}
	public void setJkyy(String jkyy) {
		this.jkyy = jkyy;
	}
	public String getJkqtyy() {
		return jkqtyy;
	}
	public void setJkqtyy(String jkqtyy) {
		this.jkqtyy = jkqtyy;
	}
	public String getJyxdkbz() {
		return jyxdkbz;
	}
	public void setJyxdkbz(String jyxdkbz) {
		this.jyxdkbz = jyxdkbz;
	}
	public String getJyfw() {
		return jyfw;
	}
	public void setJyfw(String jyfw) {
		this.jyfw = jyfw;
	}
	public String getQyzxdkzl() {
		return qyzxdkzl;
	}
	public void setQyzxdkzl(String qyzxdkzl) {
		this.qyzxdkzl = qyzxdkzl;
	}
	public String getSfyt() {
		return sfyt;
	}
	public void setSfyt(String sfyt) {
		this.sfyt = sfyt;
	}
	public String getSfxzlhy() {
		return sfxzlhy;
	}
	public void setSfxzlhy(String sfxzlhy) {
		this.sfxzlhy = sfxzlhy;
	}
	public String getHyfl() {
		return hyfl;
	}
	public void setHyfl(String hyfl) {
		this.hyfl = hyfl;
	}
	public String getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(String replyCode) {
		this.replyCode = replyCode;
	}
	public String getReplyExp() {
		return replyExp;
	}
	public void setReplyExp(String replyExp) {
		this.replyExp = replyExp;
	}
	
	
}