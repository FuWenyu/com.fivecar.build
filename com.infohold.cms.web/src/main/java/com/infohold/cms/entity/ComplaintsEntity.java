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
@Table(name = "fc_app_complaints", schema = "")
@SuppressWarnings("serial")
public class ComplaintsEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**标题*/
	private java.lang.String title;
	/**反馈描述*/
	private java.lang.String description;
	
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
	 * @return the description
	 */
	@Column(name ="description",nullable=false,columnDefinition="varchar(255)default ''")
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
