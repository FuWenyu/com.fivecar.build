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
 * @Description: 车型信息
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_ssss_model", schema = "")
@SuppressWarnings("serial")
public class CarModelEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**车型名称*/
	private java.lang.String modelName;
	/**车型照片*/
	private java.lang.String url;
	/**车型照片原地址*/
	private java.lang.String urlreal;
	/**图片名称*/
	private java.lang.String imageName;
	/**品牌id*/
	private java.lang.String carbrandid;
	/**品牌*/
	private java.lang.String carbrand;
	/**官方指导价格*/
	private java.lang.String originalprice;
	/**折扣价格*/
	private java.lang.String discountprice;
	/**车辆id*/
	private java.lang.String vehicleid;
	/**车辆*/
	private java.lang.String vehicle;
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
	 * @return the modelName
	 */
	@Column(name ="modelName",nullable=false,columnDefinition="varchar(64)default ''")
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
	 * @return the url
	 */
	@Column(name ="url",columnDefinition="varchar(255)default ''")
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
	@Column(name ="urlreal",columnDefinition="varchar(255)default ''")
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
	 * @return the imageName
	 */
	@Column(name ="imageName",columnDefinition="varchar(64)default ''")
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
	 * @return the originalprice
	 */
	@Column(name ="originalprice",columnDefinition="varchar(36)default ''")
	public java.lang.String getOriginalprice() {
		return originalprice;
	}
	/**
	 * @param originalprice the originalprice to set
	 */
	public void setOriginalprice(java.lang.String originalprice) {
		this.originalprice = originalprice;
	}
	/**
	 * @return the discountprice
	 */
	@Column(name ="discountprice",columnDefinition="varchar(36)default ''")
	public java.lang.String getDiscountprice() {
		return discountprice;
	}
	/**
	 * @param discountprice the discountprice to set
	 */
	public void setDiscountprice(java.lang.String discountprice) {
		this.discountprice = discountprice;
	}

	/**
	 * @return the vehicleid
	 */
	@Column(name ="vehicleid",nullable=true,columnDefinition="varchar(36)default ''")
	public java.lang.String getVehicleid() {
		return vehicleid;
	}
	/**
	 * @param vehicleid the vehicleid to set
	 */
	public void setVehicleid(java.lang.String vehicleid) {
		this.vehicleid = vehicleid;
	}
	/**
	 * @return the vehicle
	 */
	@Column(name ="vehicle",nullable=true,columnDefinition="varchar(64)default ''")
	public java.lang.String getVehicle() {
		return vehicle;
	}
	/**
	 * @param vehicle the vehicle to set
	 */
	public void setVehicle(java.lang.String vehicle) {
		this.vehicle = vehicle;
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
