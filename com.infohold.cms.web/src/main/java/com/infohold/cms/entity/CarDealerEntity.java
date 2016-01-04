package com.infohold.cms.entity;

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
 * @Description: 4s店信息
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_ssss_dealer", schema = "")
@SuppressWarnings("serial")
public class CarDealerEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**4s店名称*/
	private java.lang.String dealerName;
	/**联系电话*/
	private java.lang.String telephone;
	/**经营品牌*/
	private java.lang.String carbrandid;
	/**经营品牌*/
	private java.lang.String carbrand;
	/**地址*/
	private java.lang.String addr;
	/**经纬度*/
	private java.lang.String position;
	/**创建人*/
	private java.lang.String createName;
	/**创建日期*/
	private Timestamp  createDate;
	/**描述*/
	private java.lang.String  description;
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
	 * @return the dealerName
	 */
	@Column(name ="dealerName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getDealerName() {
		return dealerName;
	}
	/**
	 * @param dealerName the dealerName to set
	 */
	public void setDealerName(java.lang.String dealerName) {
		this.dealerName = dealerName;
	}
	/**
	 * @return the telephone
	 */
	@Column(name ="telephone",nullable=false,columnDefinition="varchar(11)default ''")
	public java.lang.String getTelephone() {
		return telephone;
	}
	/**
	 * @param telephone the telephone to set
	 */
	public void setTelephone(java.lang.String telephone) {
		this.telephone = telephone;
	}
	
	/**
	 * @return the carbrandid
	 */
	@Column(name ="carbrandid",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getCarbrandid() {
		return carbrandid;
	}
	/**
	 * @param carbrandid the carbrandid to set
	 */
	public void setCarbrandid(java.lang.String carbrandid) {
		this.carbrandid = carbrandid;
	}
	/**
	 * @return the carbrand
	 */
	@Column(name ="carbrand",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getCarbrand() {
		return carbrand;
	}
	/**
	 * @param carbrand the carbrand to set
	 */
	public void setCarbrand(java.lang.String carbrand) {
		this.carbrand = carbrand;
	}
	/**
	 * @return the addr
	 */
	@Column(name ="addr",nullable=false,columnDefinition="varchar(255)default ''")
	public java.lang.String getAddr() {
		return addr;
	}
	/**
	 * @param addr the addr to set
	 */
	public void setAddr(java.lang.String addr) {
		this.addr = addr;
	}
	/**
	 * @return the position
	 */
	@Column(name ="position",columnDefinition="varchar(255)default ''")
	public java.lang.String getPosition() {
		return position;
	}
	/**
	 * @param position the position to set
	 */
	public void setPosition(java.lang.String position) {
		this.position = position;
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
	@Column(name ="description",columnDefinition="varchar(128)default ''")
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
