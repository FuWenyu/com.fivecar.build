package com.infohold.cms.basic.entity;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 附件Entity
 * @author wanglei
 *
 */
@Entity
@Table(name = "biz_attachment_info")
public class AttachmentEntity extends BaseEntity {

	/**
	 * 附件信息表
	 */
	private static final long serialVersionUID = 1L;

	//附件主键ID
	@Id
	@Column(name = "att_id")
	private String att_id;

	//附件名
	@Column(name = "att_name")
	private String att_name;
	
	//附件类型
	@Column(name = "att_suffix")
	private String att_suffix;
	
	//附件大小
	@Column(name = "att_size")
	private Long att_size;
	
	//附件BLOB字段
	@Column(name = "att_blob")
	private Blob att_blob;

	//业务ID
	@Column(name = "biz_id")
	private int biz_id;
	
	//业务类型
	@Column(name = "biz_type")
	private int biz_type;

	@Column(name = "create_date")
	private String create_date;
	
	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getAtt_id() {
		return att_id;
	}

	public void setAtt_id(String att_id) {
		this.att_id = att_id;
	}

	public String getAtt_name() {
		return att_name;
	}

	public void setAtt_name(String att_name) {
		this.att_name = att_name;
	}

	public int getBiz_id() {
		return biz_id;
	}

	public void setBiz_id(int biz_id) {
		this.biz_id = biz_id;
	}

	public int getBiz_type() {
		return biz_type;
	}

	public void setBiz_type(int biz_type) {
		this.biz_type = biz_type;
	}

	public String getAtt_suffix() {
		return att_suffix;
	}

	public void setAtt_suffix(String att_suffix) {
		this.att_suffix = att_suffix;
	}

	public Long getAtt_size() {
		return att_size;
	}

	public void setAtt_size(Long att_size) {
		this.att_size = att_size;
	}

	public Blob getAtt_blob() {
		return att_blob;
	}

	public void setAtt_blob(Blob att_blob) {
		this.att_blob = att_blob;
	}
	
}
