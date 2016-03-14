package com.infohold.cms.entity;

import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;






//import org.hibernate.annotations.DynamicInsert;
//import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import com.infohold.cms.basic.entity.BaseEntity;

/**   
 * @Title: Entity
 * @Description: 图文资源实例
 * @author fwy
 * @date 2015-12-16 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_app_resources", schema = "")
@SuppressWarnings("serial")
public class ResourcesEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**标题*/
	private java.lang.String title;
	/**资源用途*/
	private java.lang.String purpose;
	/**资源用途*/
	private java.lang.String purposeName;
	/**资源名称*/
	private java.lang.String resourceName;
	/**创建人*/
	private java.lang.String createName;
	/**创建日期*/
	private Timestamp  createDate;
	/**资源*/
	private java.lang.String  resource;
	
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
	@Column(name ="resourceName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getResourceName(){
		return this.resourceName;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片名称
	 */
	public void setResourceName(java.lang.String resourceName){
		this.resourceName = resourceName;
	}


	/**
	 * @return the purpose
	 */
	@Column(name ="purpose",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getPurpose() {
		return purpose;
	}

	/**
	 * @param purpose the purpose to set
	 */
	public void setPurpose(java.lang.String purpose) {
		this.purpose = purpose;
	}

	/**
	 * @return the purposeName
	 */
	@Column(name ="purposeName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getPurposeName() {
		return purposeName;
	}

	/**
	 * @param purposeName the purposeName to set
	 */
	public void setPurposeName(java.lang.String purposeName) {
		this.purposeName = purposeName;
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
	 * @return the resource
	 */
	@Basic(fetch = FetchType.LAZY)   
	@Type(type="text")
	@Column(name="resource", nullable=true)
	public java.lang.String getResource() {
		return resource;
	}

	/**
	 * @param resource the resource to set
	 */
	public void setResource(java.lang.String resource) {
		this.resource = resource;
	}

}
