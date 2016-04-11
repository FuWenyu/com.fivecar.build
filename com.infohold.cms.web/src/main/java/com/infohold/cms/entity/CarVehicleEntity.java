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
 * @Description: 车辆信息
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_ssss_vehicle", schema = "")
@SuppressWarnings("serial")
public class CarVehicleEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**机构id*/
	private java.lang.String orgid;
	/**车辆名称*/
	private java.lang.String vehicleName;
	/**车辆图片*/
	private java.lang.String imageName;
	/**品牌*/
	private java.lang.String carbrandid;
	/**品牌*/
	private java.lang.String carbrand;
	/**价格区间*/
	private java.lang.String price;
	/**logo url*/
	private java.lang.String url;
	/**logo原地址*/
	private java.lang.String urlreal;
	/**链接找车页url*/
	private java.lang.String anchor;
	/**所属4s店经销商*/
	private java.lang.String belong;
	/**经销商名称*/
	private java.lang.String belongName;
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
	 * @return the orgid
	 */
	@Column(name = "orgid", nullable=true,length = 32)
	public java.lang.String getOrgid() {
		return orgid;
	}
	/**
	 * @param orgid the orgid to set
	 */
	public void setOrgid(java.lang.String orgid) {
		this.orgid = orgid;
	}
	/**
	 * @return the imageName
	 */
	@Column(name ="imageName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getImageName() {
		return imageName;
	}
	/**
	 * @param imageName the imageName to set
	 */
	public void setImageName(java.lang.String imageName) {
		this.imageName = imageName;
	}
	/**
	 * @return the vehicleName
	 */
	@Column(name ="vehicleName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getVehicleName() {
		return vehicleName;
	}
	/**
	 * @param vehicleName the vehicleName to set
	 */
	public void setVehicleName(java.lang.String vehicleName) {
		this.vehicleName = vehicleName;
	}
	
	/**
	 * @return the carbrandid
	 */
	@Column(name ="carbrandid",nullable=false,columnDefinition="varchar(36)default ''")
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
	 * @return the price
	 */
	@Column(name ="price",nullable=false,columnDefinition="varchar(36)default ''")
	public java.lang.String getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(java.lang.String price) {
		this.price = price;
	}
	
	/**
	 * @return the url
	 */
	@Column(name ="url",nullable=false,columnDefinition="varchar(255)default ''")
	public java.lang.String getUrl() {
		return url;
	}
	/**
	 * @param url the url to set
	 */
	public void setUrl(java.lang.String url) {
		this.url = url;
	}
	/**
	 * @return the urlreal
	 */
	@Column(name ="urlreal",nullable=false,columnDefinition="varchar(255)default ''")
	public java.lang.String getUrlreal() {
		return urlreal;
	}
	/**
	 * @param urlreal the urlreal to set
	 */
	public void setUrlreal(java.lang.String urlreal) {
		this.urlreal = urlreal;
	}
	
	/**
	 * @return the anchor
	 */
	@Column(name ="anchor",columnDefinition="varchar(255)default ''")
	public java.lang.String getAnchor() {
		return anchor;
	}
	/**
	 * @param anchor the anchor to set
	 */
	public void setAnchor(java.lang.String anchor) {
		this.anchor = anchor;
	}
	/**
	 * @return the belong
	 */
	@Column(name ="belong",nullable=false,columnDefinition="varchar(36)default ''")
	public java.lang.String getBelong() {
		return belong;
	}
	/**
	 * @param belong the belong to set
	 */
	public void setBelong(java.lang.String belong) {
		this.belong = belong;
	}
	/**
	 * @return the belongName
	 */
	@Column(name ="belongName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getBelongName() {
		return belongName;
	}
	/**
	 * @param belongName the belongName to set
	 */
	public void setBelongName(java.lang.String belongName) {
		this.belongName = belongName;
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
