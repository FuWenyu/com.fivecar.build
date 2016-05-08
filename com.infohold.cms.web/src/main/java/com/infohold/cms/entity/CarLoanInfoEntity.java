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
@Table(name = "fc_ssss_loaninfo", schema = "")
@SuppressWarnings("serial")
public class CarLoanInfoEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**用户姓名*/
	private java.lang.String user_name;
	/**电话号码*/
	private java.lang.String telephone;
	/**反馈描述*/
	private java.lang.String model_id;
	/**车型名称*/
	private java.lang.String model_name;
	/**首付*/
	private java.lang.String downpayment;
	/**期数*/
	private java.lang.String periods;
	
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
	 * @return the user_name
	 */
	@Column(name ="user_name",nullable=false,columnDefinition="varchar(64)default ''")
	public java.lang.String getUser_name() {
		return user_name;
	}

	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(java.lang.String user_name) {
		this.user_name = user_name;
	}

	/**
	 * @return the telephone
	 */
	@Column(name ="telephone",nullable=true,columnDefinition="varchar(20)default ''")
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
	 * @return the model_id
	 */
	@Column(name ="model_id",nullable=true,columnDefinition="varchar(36)default ''")
	public java.lang.String getModel_id() {
		return model_id;
	}

	/**
	 * @param model_id the model_id to set
	 */
	public void setModel_id(java.lang.String model_id) {
		this.model_id = model_id;
	}

	/**
	 * @return the model_name
	 */
	@Column(name ="model_name",nullable=true,columnDefinition="varchar(64)default ''")
	public java.lang.String getModel_name() {
		return model_name;
	}

	/**
	 * @param model_name the model_name to set
	 */
	public void setModel_name(java.lang.String model_name) {
		this.model_name = model_name;
	}

	/**
	 * @return the downpayment
	 */
	@Column(name ="downpayment",nullable=true,columnDefinition="varchar(12)default ''")
	public java.lang.String getDownpayment() {
		return downpayment;
	}

	/**
	 * @param downpayment the downpayment to set
	 */
	public void setDownpayment(java.lang.String downpayment) {
		this.downpayment = downpayment;
	}

	/**
	 * @return the periods
	 */
	@Column(name ="periods",nullable=true,columnDefinition="varchar(12)default ''")
	public java.lang.String getPeriods() {
		return periods;
	}

	/**
	 * @param periods the periods to set
	 */
	public void setPeriods(java.lang.String periods) {
		this.periods = periods;
	}
	
}
