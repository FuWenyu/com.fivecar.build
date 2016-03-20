/*package com.infohold.cms.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.infohold.cms.basic.entity.BaseEntity;

*//**   
 * @Title: Entity
 * @Description: 汽车金融
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 *//*
@Entity
@Table(name = "fc_ssss_loan", schema = "")
@SuppressWarnings("serial")
public class CarLoanEntity extends BaseEntity {
	*//**主键*//*
	private java.lang.String id;
	*//**车辆id*//*
	private java.lang.String vehicleid;
	*//**车辆*//*
	private java.lang.String vehicle;
	*//**购置税*//*
	private BigDecimal tax;
	*//**交强险*//*
	private BigDecimal CompulsoryInsurance;
	*//**牌照费用*//*
	private BigDecimal LicensePlate;
	*//**车损险*//*
	private BigDecimal CDW;
	*//**第三者责任险*//*
	private BigDecimal ThirdParityLiability;
	*//**其它保险*//*
	private BigDecimal OtherInsurance;
	*//**创建人*//*
	private java.lang.String createName;
	*//**创建日期*//*
	private Timestamp  createDate;
	*//**描述*//*
	private java.lang.String  description;
	*//**
	 * @return the id
	 *//*
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	public java.lang.String getId() {
		return id;
	}
	*//**
	 * @param id the id to set
	 *//*
	public void setId(java.lang.String id) {
		this.id = id;
	}
	*//**
	 * @return the vehicleid
	 *//*
	@Column(name ="vehicleid",nullable=true,columnDefinition="varchar(36)default ''")
	public java.lang.String getVehicleid() {
		return vehicleid;
	}
	*//**
	 * @param vehicleid the vehicleid to set
	 *//*
	public void setVehicleid(java.lang.String vehicleid) {
		this.vehicleid = vehicleid;
	}
	*//**
	 * @return the vehicle
	 *//*
	@Column(name ="vehicle",nullable=true,columnDefinition="varchar(64)default ''")
	public java.lang.String getVehicle() {
		return vehicle;
	}
	*//**
	 * @param vehicle the vehicle to set
	 *//*
	public void setVehicle(java.lang.String vehicle) {
		this.vehicle = vehicle;
	}
	*//**
	 * @return the tax
	 *//*
	
	public BigDecimal getTax() {
		return tax;
	}
	*//**
	 * @param tax the tax to set
	 *//*
	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}
	*//**
	 * @return the compulsoryInsurance
	 *//*
	public BigDecimal getCompulsoryInsurance() {
		return CompulsoryInsurance;
	}
	*//**
	 * @param compulsoryInsurance the compulsoryInsurance to set
	 *//*
	public void setCompulsoryInsurance(BigDecimal compulsoryInsurance) {
		CompulsoryInsurance = compulsoryInsurance;
	}
	*//**
	 * @return the licensePlate
	 *//*
	public BigDecimal getLicensePlate() {
		return LicensePlate;
	}
	*//**
	 * @param licensePlate the licensePlate to set
	 *//*
	public void setLicensePlate(BigDecimal licensePlate) {
		LicensePlate = licensePlate;
	}
	*//**
	 * @return the cDW
	 *//*
	public BigDecimal getCDW() {
		return CDW;
	}
	*//**
	 * @param cDW the cDW to set
	 *//*
	public void setCDW(BigDecimal cDW) {
		CDW = cDW;
	}
	*//**
	 * @return the thirdParityLiability
	 *//*
	public BigDecimal getThirdParityLiability() {
		return ThirdParityLiability;
	}
	*//**
	 * @param thirdParityLiability the thirdParityLiability to set
	 *//*
	public void setThirdParityLiability(BigDecimal thirdParityLiability) {
		ThirdParityLiability = thirdParityLiability;
	}
	*//**
	 * @return the otherInsurance
	 *//*
	public BigDecimal getOtherInsurance() {
		return OtherInsurance;
	}
	*//**
	 * @param otherInsurance the otherInsurance to set
	 *//*
	public void setOtherInsurance(BigDecimal otherInsurance) {
		OtherInsurance = otherInsurance;
	}
	*//**
	 * @return the createName
	 *//*
	public java.lang.String getCreateName() {
		return createName;
	}
	*//**
	 * @param createName the createName to set
	 *//*
	public void setCreateName(java.lang.String createName) {
		this.createName = createName;
	}
	*//**
	 * @return the createDate
	 *//*
	public Timestamp getCreateDate() {
		return createDate;
	}
	*//**
	 * @param createDate the createDate to set
	 *//*
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	*//**
	 * @return the description
	 *//*
	public java.lang.String getDescription() {
		return description;
	}
	*//**
	 * @param description the description to set
	 *//*
	public void setDescription(java.lang.String description) {
		this.description = description;
	}

}
*/