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
@Table(name = "fc_parallel_vehicle", schema = "")
@SuppressWarnings("serial")
public class ParallelVehicleEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
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
	/**价格区间*/
	private java.lang.String pricearea;
	/**logo url*/
	private java.lang.String url;
	/**logo原地址*/
	private java.lang.String urlreal;
	/**车辆信息*/
	private java.lang.String vehicleinfo;
	/**车辆版本*/
	private java.lang.String vehicleversion;
	/**所在位置*/
	private java.lang.String whereis;
	/**销售范围*/
	private java.lang.String salesarea;
	/**颜色*/
	private java.lang.String color;
	/**环保标准*/
	private java.lang.String epstandard;
	/**看车地点*/
	private java.lang.String wherelook;
	/**经销商*/
	private java.lang.String dealerid;
	/**经销商*/
	private java.lang.String dealerName;
	/**链接找车页url*/
	private java.lang.String anchor;
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
	@Column(name ="price",nullable=false,columnDefinition="varchar(32)default ''")
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
	 * @return the pricearea
	 */
	@Column(name ="pricearea",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getPricearea() {
		return pricearea;
	}
	/**
	 * @param pricearea the pricearea to set
	 */
	public void setPricearea(java.lang.String pricearea) {
		this.pricearea = pricearea;
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
	 * @return the vehicleinfo
	 */
	@Column(name ="vehicleinfo",columnDefinition="varchar(64)default ''")
	public java.lang.String getVehicleinfo() {
		return vehicleinfo;
	}
	/**
	 * @param vehicleinfo the vehicleinfo to set
	 */
	public void setVehicleinfo(java.lang.String vehicleinfo) {
		this.vehicleinfo = vehicleinfo;
	}
	/**
	 * @return the vehicleversion
	 */
	@Column(name ="vehicleversion",columnDefinition="varchar(64)default ''")
	public java.lang.String getVehicleversion() {
		return vehicleversion;
	}
	/**
	 * @param vehicleversion the vehicleversion to set
	 */
	public void setVehicleversion(java.lang.String vehicleversion) {
		this.vehicleversion = vehicleversion;
	}
	/**
	 * @return the whereis
	 */
	@Column(name ="whereis",columnDefinition="varchar(64)default ''")
	public java.lang.String getWhereis() {
		return whereis;
	}
	/**
	 * @param whereis the whereis to set
	 */
	public void setWhereis(java.lang.String whereis) {
		this.whereis = whereis;
	}
	/**
	 * @return the salesarea
	 */
	@Column(name ="salesarea",columnDefinition="varchar(64)default ''")
	public java.lang.String getSalesarea() {
		return salesarea;
	}
	/**
	 * @param salesarea the salesarea to set
	 */
	public void setSalesarea(java.lang.String salesarea) {
		this.salesarea = salesarea;
	}
	/**
	 * @return the color
	 */
	@Column(name ="color",columnDefinition="varchar(64)default ''")
	public java.lang.String getColor() {
		return color;
	}
	/**
	 * @param color the color to set
	 */
	public void setColor(java.lang.String color) {
		this.color = color;
	}
	/**
	 * @return the epstandard
	 */
	@Column(name ="epstandard",columnDefinition="varchar(64)default ''")
	public java.lang.String getEpstandard() {
		return epstandard;
	}
	/**
	 * @param epstandard the epstandard to set
	 */
	public void setEpstandard(java.lang.String epstandard) {
		this.epstandard = epstandard;
	}
	/**
	 * @return the wherelook
	 */
	@Column(name ="wherelook",columnDefinition="varchar(64)default ''")
	public java.lang.String getWherelook() {
		return wherelook;
	}
	/**
	 * @param wherelook the wherelook to set
	 */
	public void setWherelook(java.lang.String wherelook) {
		this.wherelook = wherelook;
	}
	
	/**
	 * @return the dealerid
	 */
	@Column(name ="dealerid",columnDefinition="varchar(36)default ''")
	public java.lang.String getDealerid() {
		return dealerid;
	}
	/**
	 * @param dealerid the dealerid to set
	 */
	public void setDealerid(java.lang.String dealerid) {
		this.dealerid = dealerid;
	}
	/**
	 * @return the dealerName
	 */
	@Column(name ="dealerName",columnDefinition="varchar(64)default ''")
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
	@Column(name ="description",nullable=true,columnDefinition="varchar(255)default ''")
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
