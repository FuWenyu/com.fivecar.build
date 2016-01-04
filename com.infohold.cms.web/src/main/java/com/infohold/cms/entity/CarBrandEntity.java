package com.infohold.cms.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



//import org.hibernate.annotations.DynamicInsert;
//import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;

import com.infohold.cms.basic.entity.BaseEntity;

/**   
 * @Title: Entity
 * @Description: 汽车品牌
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_ssss_brand", schema = "")
@SuppressWarnings("serial")
public class CarBrandEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**品牌首字母*/
	private java.lang.String initial;
	/**品牌名称中文*/
	private java.lang.String brandNamecn;
	/**品牌名称英文*/
	private java.lang.String brandNameen;
	/**品牌logo*/
	private java.lang.String imageName;
	/**logo url*/
	private java.lang.String url;
	/**logo原地址*/
	private java.lang.String urlreal;
	/**创建人*/
	private java.lang.String createName;
	/**创建日期*/
	private Timestamp  createDate;
	/**描述*/
	private java.lang.String  description;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	
	/**
	 * @return the initial
	 */
	@Column(name ="initial",nullable=false,columnDefinition="varchar(1)default 'A'",unique = true)
	public java.lang.String getInitial() {
		return initial;
	}

	/**
	 * @param initial the initial to set
	 */
	public void setInitial(java.lang.String initial) {
		this.initial = initial;
	}

	/**
	 * @return the brandNamecn
	 */
	@Column(name ="brandNamecn",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getBrandNamecn() {
		return brandNamecn;
	}

	/**
	 * @param brandNamecn the brandNamecn to set
	 */
	public void setBrandNamecn(java.lang.String brandNamecn) {
		this.brandNamecn = brandNamecn;
	}

	/**
	 * @return the brandNameen
	 */
	@Column(name ="brandNameen",nullable=false,columnDefinition="varchar(64)default ''",unique = true)
	public java.lang.String getBrandNameen() {
		return brandNameen;
	}

	/**
	 * @param brandNameen the brandNameen to set
	 */
	public void setBrandNameen(java.lang.String brandNameen) {
		this.brandNameen = brandNameen;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人
	 */
	@Column(name ="createName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getCreateName(){
		return this.createName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人
	 */
	public void setCreateName(java.lang.String createName){
		this.createName = createName;
	}
	

	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建日期
	 */
	@Column(name ="createDate",nullable=false)
	public Timestamp getCreateDate(){
		return this.createDate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建日期
	 */
	public void setCreateDate(Timestamp createDate){
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
	
}
