package com.infohold.cms.basic.service.impl;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.service.IMsgSendService;
import com.infohold.cms.basic.util.SysConfigUtil;

@Service(value = "msgSendServiceImpl")
public class MsgSendServiceImpl implements IMsgSendService {

	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	private String mail_host=null;
	
	private String mail_user=null;
	
	private String mail_pass=null;
	
	private String mail_postfix=null;
	
	@Override
	public void sendMail(int cust_id, String title, String content,
			String mail_add) {
		init();
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setTo(mail_add);
		mailMessage.setFrom(mail_user+mail_postfix);
		mailMessage.setSubject(title);
		mailMessage.setText(content);
		javaMailSenderImpl.send(mailMessage);
	}

	@Override
	public void sendNote(int cust_id, String content, String phone_no) {
		
	}
	
	private void init(){
		if(mail_host == null){
			mail_host=sysConfigUtil.getCfgInfo("mail_host");
			mail_user=sysConfigUtil.getCfgInfo("mail_user");
			mail_pass=sysConfigUtil.getCfgInfo("mail_pass");
			mail_postfix=sysConfigUtil.getCfgInfo("mail_postfix");
			javaMailSenderImpl.setHost(mail_host);
			javaMailSenderImpl.setUsername(mail_user); 
			javaMailSenderImpl.setPassword(mail_pass);
			Properties prop = new Properties();
			prop.put("mail.smtp.auth", "true"); 
			prop.put("mail.smtp.timeout", "25000");
			javaMailSenderImpl.setJavaMailProperties(prop);
		}
	}



}
