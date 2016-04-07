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
@Table(name = "fc_user_collection", schema = "")
@SuppressWarnings("serial")
public class CollectionEntity extends BaseEntity {
	/**主键*/
	private java.lang.String user_id;
	/**标题*/
	private java.lang.String resource_id;
	/**图片名称*/
	private java.lang.String resource_type;
	/**
	 * @return the user_id
	 */
	@Column(name ="user_id",nullable=false,columnDefinition="varchar(36)default ''")
	public java.lang.String getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(java.lang.String user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the resource_id
	 */
	@Column(name ="resource_id",nullable=false,columnDefinition="varchar(36)default ''")
	public java.lang.String getResource_id() {
		return resource_id;
	}
	/**
	 * @param resource_id the resource_id to set
	 */
	public void setResource_id(java.lang.String resource_id) {
		this.resource_id = resource_id;
	}
	/**
	 * @return the resource_type
	 */
	@Column(name ="resource_type",nullable=false,columnDefinition="varchar(8)default ''")
	public java.lang.String getResource_type() {
		return resource_type;
	}
	/**
	 * @param resource_type the resource_type to set
	 */
	public void setResource_type(java.lang.String resource_type) {
		this.resource_type = resource_type;
	}
}