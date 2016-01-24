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
@Table(name = "fc_parallel_versionlist", schema = "")
@SuppressWarnings("serial")
public class ParallelVersionEntity extends BaseEntity {
	/**主键*/
	private java.lang.String id;
	/**品牌首字母*/
	private java.lang.String versionkey;
	/**品牌名称中文*/
	private java.lang.String versionvalue;
	
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
	 * @return the versionkey
	 */
	@Column(name ="versionkey",columnDefinition="varchar(32)default ''",unique = true)
	public java.lang.String getVersionkey() {
		return versionkey;
	}

	/**
	 * @param versionkey the versionkey to set
	 */
	public void setVersionkey(java.lang.String versionkey) {
		this.versionkey = versionkey;
	}

	/**
	 * @return the versionvalue
	 */
	@Column(name ="versionvalue",columnDefinition="varchar(64)default ''",unique = true)
	public java.lang.String getVersionvalue() {
		return versionvalue;
	}

	/**
	 * @param versionvalue the versionvalue to set
	 */
	public void setVersionvalue(java.lang.String versionvalue) {
		this.versionvalue = versionvalue;
	}

}
