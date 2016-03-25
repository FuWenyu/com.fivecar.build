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
 * @Description: 金融机构信息
 * @author fwy
 * @date 2015-12-7 22:07:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "fc_ssss_lender", schema = "")
@SuppressWarnings("serial")
public class CarLenderEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**金融机构名称*/
	private java.lang.String lenderName;
	/**金融机构照片*/
	private java.lang.String url;
	/**金融机构照片原地址*/
	private java.lang.String urlreal;
	/**图片名称*/
	private java.lang.String imageName;
	/**联系电话*/
	private java.lang.String telephone;
	/**图文资源id*/
	private java.lang.String resourceid;
	/**专属优惠*/
	private java.lang.String privileges;
	/**专属优惠连接*/
	private java.lang.String privilegesurl;
	/**专属优惠标题*/
	private java.lang.String privilegestile;
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
	 * @return the lenderName
	 */
	@Column(name ="lenderName",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getLenderName() {
		return lenderName;
	}
	/**
	 * @param lenderName the lenderName to set
	 */
	public void setLenderName(java.lang.String lenderName) {
		this.lenderName = lenderName;
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
	 * @return the telephone
	 */
	@Column(name ="telephone",columnDefinition="varchar(11)default ''")
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
	 * @return the resourceid
	 */
	@Column(name ="resourceid",columnDefinition="varchar(36)default ''")
	public java.lang.String getResourceid() {
		return resourceid;
	}
	/**
	 * @param resourceid the resourceid to set
	 */
	public void setResourceid(java.lang.String resourceid) {
		this.resourceid = resourceid;
	}
	/**
	 * @return the privileges
	 */
	@Column(name ="privileges",columnDefinition="varchar(255)default ''")
	public java.lang.String getPrivileges() {
		return privileges;
	}
	/**
	 * @param privileges the privileges to set
	 */
	public void setPrivileges(java.lang.String privileges) {
		this.privileges = privileges;
	}
	/**
	 * @return the privilegesurl
	 */
	@Column(name ="privilegesurl",columnDefinition="varchar(255)default ''")
	public java.lang.String getPrivilegesurl() {
		return privilegesurl;
	}
	/**
	 * @param privilegesurl the privilegesurl to set
	 */
	public void setPrivilegesurl(java.lang.String privilegesurl) {
		this.privilegesurl = privilegesurl;
	}
	/**
	 * @return the privilegestile
	 */
	@Column(name ="privilegestile",columnDefinition="varchar(255)default ''")
	public java.lang.String getPrivilegestile() {
		return privilegestile;
	}
	/**
	 * @param privilegestile the privilegestile to set
	 */
	public void setPrivilegestile(java.lang.String privilegestile) {
		this.privilegestile = privilegestile;
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
