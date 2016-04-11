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
 * 用户表
 *  
 * @author fwy
 */
@Entity
@Table(name = "fc_app_user")
public class AppUserEntity extends BaseEntity {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	private String id;
	
	@Column(name = "user_no",columnDefinition="varchar(32)default ''")
	private String user_no;
	
	@Column(name = "user_name",unique=true,columnDefinition="varchar(32)default ''")
	private String user_name;
	
	@Column(name = "password",nullable=false,columnDefinition="varchar(128)default ''")
	private String password;
	
	@Column(name = "email",columnDefinition="varchar(32)default ''")
	private String email;
	
	@Column(name = "phone",unique=true,nullable=false,columnDefinition="numeric(11)default 0")
	private String phone;
	
	@Column(name = "create_date")
	private Timestamp create_date;
	
	@Column(name = "update_date")
	private Timestamp update_date;
	
	@Column(name = "id_no",columnDefinition="varchar(18)default ''")
	private String id_no;
	
	@Column(name = "sex",columnDefinition="varchar(8)default ''")
	private String sex;
	
	@Column(name = "user_addr",columnDefinition="varchar(255)default ''")
	private String user_addr;
	
	@Column(name = "user_addradd",columnDefinition="varchar(255)default ''")
	private String user_addradd;
	
	@Column(name = "profile_images",columnDefinition="varchar(255)default ''")
	private String profile_images;
	
	@Column(name = "user_status",columnDefinition="varchar(8)default ''")
	private String user_status;
	
	@Column(name = "user_type",columnDefinition="varchar(8)default ''")
	private String user_type;
	
	@Column(name = "user_ask1",columnDefinition="varchar(255)default ''")
	private String user_ask1;
	
	@Column(name = "user_answer1",columnDefinition="varchar(255)default ''")
	private String user_answer1;
	
	@Column(name = "user_desc",columnDefinition="varchar(64)default ''")
	private String user_desc;
	
	@Column(name = "user_rsv1",columnDefinition="varchar(64)default ''")
	private String user_rsv1;
	
	@Column(name = "user_rsv2",columnDefinition="varchar(64)default ''")
	private String user_rsv2;
	
	@Column(name = "user_rsv3",columnDefinition="varchar(64)default ''")
	private String user_rsv3;
	
	@Column(name = "user_rsv4",columnDefinition="varchar(64)default ''")
	private String user_rsv4;
	


	/**
	 * @return the user_no
	 */
	public String getUser_no() {
		return user_no;
	}

	/**
	 * @param user_no the user_no to set
	 */
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the create_date
	 */
	public Timestamp getCreate_date() {
		return create_date;
	}

	/**
	 * @param create_date the create_date to set
	 */
	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}

	/**
	 * @return the update_date
	 */
	public Timestamp getUpdate_date() {
		return update_date;
	}

	/**
	 * @param update_date the update_date to set
	 */
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}

	/**
	 * @return the id_no
	 */
	public String getId_no() {
		return id_no;
	}

	/**
	 * @param id_no the id_no to set
	 */
	public void setId_no(String id_no) {
		this.id_no = id_no;
	}

	/**
	 * @return the user_addr
	 */
	public String getUser_addr() {
		return user_addr;
	}

	/**
	 * @param user_addr the user_addr to set
	 */
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	/**
	 * @return the user_addradd
	 */
	public String getUser_addradd() {
		return user_addradd;
	}

	/**
	 * @param user_addradd the user_addradd to set
	 */
	public void setUser_addradd(String user_addradd) {
		this.user_addradd = user_addradd;
	}

	/**
	 * @return the user_status
	 */
	public String getUser_status() {
		return user_status;
	}

	/**
	 * @param user_status the user_status to set
	 */
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	/**
	 * @return the user_type
	 */
	public String getUser_type() {
		return user_type;
	}

	/**
	 * @param user_type the user_type to set
	 */
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	/**
	 * @return the user_desc
	 */
	public String getUser_desc() {
		return user_desc;
	}

	/**
	 * @param user_desc the user_desc to set
	 */
	public void setUser_desc(String user_desc) {
		this.user_desc = user_desc;
	}
	
	/**
	 * @return the user_ask1
	 */
	public String getUser_ask1() {
		return user_ask1;
	}

	/**
	 * @param user_ask1 the user_ask1 to set
	 */
	public void setUser_ask1(String user_ask1) {
		this.user_ask1 = user_ask1;
	}

	/**
	 * @return the user_answer1
	 */
	public String getUser_answer1() {
		return user_answer1;
	}

	/**
	 * @param user_answer1 the user_answer1 to set
	 */
	public void setUser_answer1(String user_answer1) {
		this.user_answer1 = user_answer1;
	}

	/**
	 * @return the user_rsv1
	 */
	public String getUser_rsv1() {
		return user_rsv1;
	}

	/**
	 * @param user_rsv1 the user_rsv1 to set
	 */
	public void setUser_rsv1(String user_rsv1) {
		this.user_rsv1 = user_rsv1;
	}

	/**
	 * @return the user_rsv2
	 */
	public String getUser_rsv2() {
		return user_rsv2;
	}

	/**
	 * @param user_rsv2 the user_rsv2 to set
	 */
	public void setUser_rsv2(String user_rsv2) {
		this.user_rsv2 = user_rsv2;
	}

	/**
	 * @return the user_rsv3
	 */
	public String getUser_rsv3() {
		return user_rsv3;
	}

	/**
	 * @param user_rsv3 the user_rsv3 to set
	 */
	public void setUser_rsv3(String user_rsv3) {
		this.user_rsv3 = user_rsv3;
	}

	/**
	 * @return the user_rsv4
	 */
	public String getUser_rsv4() {
		return user_rsv4;
	}

	/**
	 * @param user_rsv4 the user_rsv4 to set
	 */
	public void setUser_rsv4(String user_rsv4) {
		this.user_rsv4 = user_rsv4;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}

	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	/**
	 * @return the profile_images
	 */
	public String getProfile_images() {
		return profile_images;
	}

	/**
	 * @param profile_images the profile_images to set
	 */
	public void setProfile_images(String profile_images) {
		this.profile_images = profile_images;
	}
	
	
	
}
