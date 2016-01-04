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
 * @Description: 车型配置
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_ssss_modelcfg", schema = "")
@SuppressWarnings("serial")
public class CarModeCfglEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**车辆名称*/
	private java.lang.String modelName;
	/**车辆图片*/
	private java.lang.String profile;
	/**品牌*/
	private java.lang.String carbrand;
	/**价格区间*/
	private java.lang.String price;
	/**车型列表*/
	private java.lang.String vehicleConfiguration;
	/**销售列表*/
	private java.lang.String sales;
	/**4s店经销商*/
	private java.lang.String dealers;
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
	 * @return the profile
	 */
	@Column(name ="profile",nullable=false,columnDefinition="varchar(255)default ''")
	public java.lang.String getProfile() {
		return profile;
	}
	/**
	 * @param profile the profile to set
	 */
	public void setProfile(java.lang.String profile) {
		this.profile = profile;
	}
	/**
	 * @return the carbrand
	 */
	@Column(name ="carbrand",nullable=false,columnDefinition="varchar(11)default ''")
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
	 * @return the vehicleConfiguration
	 */
	@Column(name ="vehicleConfiguration",nullable=true,columnDefinition="varchar(36)default ''")
	public java.lang.String getVehicleConfiguration() {
		return vehicleConfiguration;
	}
	/**
	 * @param vehicleConfiguration the vehicleConfiguration to set
	 */
	public void setVehicleConfiguration(java.lang.String vehicleConfiguration) {
		this.vehicleConfiguration = vehicleConfiguration;
	}
	/**
	 * @return the sales
	 */
	@Column(name ="sales",nullable=true,columnDefinition="varchar(36)default ''")
	public java.lang.String getSales() {
		return sales;
	}
	/**
	 * @param sales the sales to set
	 */
	public void setSales(java.lang.String sales) {
		this.sales = sales;
	}
	/**
	 * @return the dealers
	 */
	@Column(name ="dealers",nullable=true,columnDefinition="varchar(36)default ''")
	public java.lang.String getDealers() {
		return dealers;
	}
	/**
	 * @param dealers the dealers to set
	 */
	public void setDealers(java.lang.String dealers) {
		this.dealers = dealers;
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
