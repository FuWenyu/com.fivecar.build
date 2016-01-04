package com.infohold.cms.basic.service;

/**
 * 消息发送服务
 * @author Administrator
 *
 */
public interface IMsgSendService {
	
	/**
	 * 发送邮件
	 * @param cust_id 客户ID
	 * @param title 邮件标题
	 * @param content 邮件内容
	 * @param mail_add 邮件地址
	 */
	public void sendMail(int cust_id,String title,String content,String mail_add);
	
	/**
	 * 发送短信
	 * @param cust_id 客户ID
	 * @param content 短信内容
	 * @param phone_no 电话号
	 */
	public void sendNote(int cust_id,String content,String phone_no);
	
}
