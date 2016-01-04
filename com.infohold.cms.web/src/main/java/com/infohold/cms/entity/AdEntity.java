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
 * @Description: 广告图片
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_cms_ad", schema = "")
@SuppressWarnings("serial")
public class AdEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**标题*/
	private java.lang.String title;
	/**图片名称*/
	private java.lang.String imageid;
	/**图片名称*/
	private java.lang.String imageName;
	/**图片地址*/
	private java.lang.String imageHref;
	/**原图片地址*/
	private java.lang.String imageHrefReal;
	/**图片地址*/
	private java.lang.String url;
	/**原图片地址*/
	private java.lang.String urlreal;
	/**连接地址*/
	private java.lang.String anchor;
	/**用途*/
	private java.lang.String usefo;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标题
	 */
	@Column(name ="title",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  标题
	 */
	public void setTitle(java.lang.String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片名称
	 */
	@Column(name ="imageName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getImageName(){
		return this.imageName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片名称
	 */
	public void setImageName(java.lang.String imageName){
		this.imageName = imageName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片地址
	 */
	@Column(name ="imageHref",nullable=false,columnDefinition="varchar(255)default ''")
	public java.lang.String getImageHref(){
		return this.imageHref;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片地址
	 */
	public void setImageHref(java.lang.String imageHref){
		this.imageHref = imageHref;
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
	 * @return the imageHrefReal原图片
	 */
	@Column(name ="imageHrefReal",nullable=false,columnDefinition="varchar(255)default ''")
	public java.lang.String getImageHrefReal() {
		return imageHrefReal;
	}

	/**
	 * @param imageHrefReal the imageHrefReal to set
	 */
	public void setImageHrefReal(java.lang.String imageHrefReal) {
		this.imageHrefReal = imageHrefReal;
	}

	/**
	 * @return the usefo
	 */
	@Column(name ="usefo",nullable=false,columnDefinition="varchar(2)default ''")
	public java.lang.String getUsefo() {
		return usefo;
	}

	/**
	 * @param usefo the usefo to set
	 */
	public void setUsefo(java.lang.String usefo) {
		this.usefo = usefo;
	}

	/**
	 * @return the anchor
	 */
	@Column(name ="anchor",nullable=false,columnDefinition="varchar(255)default ''")
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
	@Column(name ="description",nullable=false,columnDefinition="varchar(128)default ''")
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
	 * @return the imageid
	 */
	@Column(name ="imageid",nullable=false,columnDefinition="varchar(32)default ''")
	public java.lang.String getImageid() {
		return imageid;
	}

	/**
	 * @param imageid the imageid to set
	 */
	public void setImageid(java.lang.String imageid) {
		this.imageid = imageid;
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
