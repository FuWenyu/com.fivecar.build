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
@Table(name = "fc_thirdparty_dealer", schema = "")
@SuppressWarnings("serial")
public class ThirdPartyDealerEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**4s店名称*/
	private java.lang.String dealerName;
	/**联系电话*/
	private java.lang.String telephone;
	/**图文资源id*/
	private java.lang.String resourceid;
	/**经营项目box*/
	private java.lang.String thirdparty_type;
	/**经营保养项目*/
	private boolean maintain;
	/**经营维修项目*/
	private boolean repair;
	/**经营配件项目*/
	private boolean parts;
	/**地址*/
	private java.lang.String addr;
	/**经纬度*/
	private java.lang.String position;
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
	 * @return the thirdparty_type
	 */
	@Column(name ="thirdparty_type",columnDefinition="varchar(64)default ''")
	public java.lang.String getThirdparty_type() {
		return thirdparty_type;
	}
	/**
	 * @param thirdparty_type the thirdparty_type to set
	 */
	public void setThirdparty_type(java.lang.String thirdparty_type) {
		this.thirdparty_type = thirdparty_type;
	}
	/**
	 * @return the maintain
	 */
	@Column(name ="maintain",nullable=false,columnDefinition="tinyint(1)default '0'")
	public boolean isMaintain() {
		return maintain;
	}
	/**
	 * @param maintain the maintain to set
	 */
	
	public void setMaintain(boolean maintain) {
		this.maintain = maintain;
	}
	/**
	 * @return the repair
	 */
	@Column(name ="repair",nullable=false,columnDefinition="tinyint(1)default '0'")
	public boolean isRepair() {
		return repair;
	}
	/**
	 * @param repair the repair to set
	 */
	public void setRepair(boolean repair) {
		this.repair = repair;
	}
	/**
	 * @return the parts
	 */
	@Column(name ="parts", nullable=false,columnDefinition="tinyint(1)default '0'")
	public boolean isParts() {
		return parts;
	}
	/**
	 * @param parts the parts to set
	 */
	public void setParts(boolean parts) {
		this.parts = parts;
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
	 * @return the resourceid
	 */
	@Column(name ="resourceid",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getResourceid() {
		return resourceid;
	}
	/**
	 * @param resourceid the resourceid to set
	 */
	public void setResourceid(java.lang.String resourceid) {
		this.resourceid = resourceid;
	}

}
