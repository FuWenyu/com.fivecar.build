package com.infohold.cms.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.infohold.cms.basic.entity.BaseEntity;

/**   
 * @Title: Entity
 * @Description: 汽车金融
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_ssss_loan", schema = "")
@SuppressWarnings("serial")
public class CarLoanEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**车辆id*/
	private java.lang.String modelid;
	/**车辆名称*/
	private java.lang.String modelName;
	/**车价*/
	private BigDecimal carprice;
	/**首付*/
	private BigDecimal downpayment;
	/**首付百分比*/
	private java.lang.String downPaymentPercent;
	/**金融机构ID*/
	private java.lang.String lenderId;
	/**金融机构*/
	private java.lang.String lender;
	/**金融机构logo*/
	private java.lang.String lenderLogo;
	/**额外费用*/
	private BigDecimal premium ;
	/**12期每期金额*/
	private BigDecimal loan12;
	/**24期每期金额*/
	private BigDecimal loan24;
	/**36期每期金额*/
	private BigDecimal loan36;
	/**48期每期金额*/
	private BigDecimal loan48;
	/**创建人*/
	private java.lang.String createName;
	/**创建日期*/
	private Timestamp  createDate;
	/**描述*/
	private java.lang.String  description;
	/**
	 * @return the id
	 */

	/**
	 * @return the id
	 */
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	public java.lang.String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(java.lang.String id) {
		this.id = id;
	}
	/**
	 * @return the modelid
	 */
	@Column(name ="modelid",nullable=false,columnDefinition="varchar(36)default ''")
	public java.lang.String getModelid() {
		return modelid;
	}
	/**
	 * @param modelid the modelid to set
	 */
	public void setModelid(java.lang.String modelid) {
		this.modelid = modelid;
	}
	/**
	 * @return the modelName
	 */
	@Column(name ="modelName",nullable=true,columnDefinition="varchar(64)default ''")
	public java.lang.String getModelName() {
		return modelName;
	}
	/**
	 * @param modelName the modelName to set
	 */
	public void setModelName(java.lang.String modelName) {
		this.modelName = modelName;
	}
	/**
	 * @return the carprice
	 */
	@Column(name ="carprice",precision=12, scale=2)
	public BigDecimal getCarprice() {
		return carprice;
	}
	/**
	 * @param carprice the carprice to set
	 */
	public void setCarprice(BigDecimal carprice) {
		this.carprice = carprice;
	}
	/**
	 * @return the downpayment
	 */
	@Column(name ="downpayment",precision=12, scale=2)
	public BigDecimal getDownpayment() {
		return downpayment;
	}
	/**
	 * @param downpayment the downpayment to set
	 */
	public void setDownpayment(BigDecimal downpayment) {
		this.downpayment = downpayment;
	}
	/**
	 * @return the downPaymentPercent
	 */
	@Column(name ="downPaymentPercent",nullable=false,columnDefinition="varchar(12)default ''")	
	public java.lang.String getDownPaymentPercent() {
		return downPaymentPercent;
	}
	/**
	 * @param downPaymentPercent the downPaymentPercent to set
	 */
	public void setDownPaymentPercent(java.lang.String downPaymentPercent) {
		this.downPaymentPercent = downPaymentPercent;
	}
	/**
	 * @return the lenderId
	 */
	@Column(name ="lenderId",nullable=false,columnDefinition="varchar(36)default ''")	
	public java.lang.String getlenderId() {
		return lenderId;
	}
	/**
	 * @param lenderId the lenderId to set
	 */
	public void setlenderId(java.lang.String lenderId) {
		this.lenderId = lenderId;
	}
	/**
	 * @return the lender
	 */
	@Column(name ="lender",nullable=false,columnDefinition="varchar(64)default ''")	
	public java.lang.String getlender() {
		return lender;
	}
	/**
	 * @param lender the lender to set
	 */
	public void setlender(java.lang.String lender) {
		this.lender = lender;
	}
	/**
	 * @return the lenderLogo
	 */
	@Column(name ="lenderLogo",nullable=false,columnDefinition="varchar(255)default ''")	
	public java.lang.String getlenderLogo() {
		return lenderLogo;
	}
	/**
	 * @param lenderLogo the lenderLogo to set
	 */
	public void setlenderLogo(java.lang.String lenderLogo) {
		this.lenderLogo = lenderLogo;
	}
	/**
	 * @return the premium
	 */
	@Column(name ="premium",precision=12, scale=2)
	public BigDecimal getPremium() {
		return premium;
	}
	/**
	 * @param premium the premium to set
	 */
	public void setPremium(BigDecimal premium) {
		this.premium = premium;
	}
	/**
	 * @return the loan12
	 */
	@Column(name ="loan12",precision=12, scale=2)
	public BigDecimal getLoan12() {
		return loan12;
	}
	/**
	 * @param loan12 the loan12 to set
	 */
	public void setLoan12(BigDecimal loan12) {
		this.loan12 = loan12;
	}
	/**
	 * @return the loan24
	 */
	@Column(name ="loan24",precision=12, scale=2)
	public BigDecimal getLoan24() {
		return loan24;
	}
	/**
	 * @param loan24 the loan24 to set
	 */
	public void setLoan24(BigDecimal loan24) {
		this.loan24 = loan24;
	}
	/**
	 * @return the loan36
	 */
	@Column(name ="loan36",precision=12, scale=2)
	public BigDecimal getLoan36() {
		return loan36;
	}
	/**
	 * @param loan36 the loan36 to set
	 */
	public void setLoan36(BigDecimal loan36) {
		this.loan36 = loan36;
	}
	/**
	 * @return the loan48
	 */
	@Column(name ="loan48",precision=12, scale=2)
	public BigDecimal getLoan48() {
		return loan48;
	}
	/**
	 * @param loan48 the loan48 to set
	 */
	public void setLoan48(BigDecimal loan48) {
		this.loan48 = loan48;
	}
	/**
	 * @return the createName
	 */
	@Column(name ="createName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getCreateName() {
		return createName;
	}
	/**
	 * @param createName the createName to set
	 */
	public void setCreateName(java.lang.String createName) {
		this.createName = createName;
	}
	/**
	 * @return the createDate
	 */
	@Column(name ="createDate",nullable=false)
	public Timestamp getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	/**
	 * @return the description
	 */
	@Column(name ="description",nullable=true,columnDefinition="varchar(128)default ''")
	public java.lang.String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(java.lang.String description) {
		this.description = description;
	}

}
