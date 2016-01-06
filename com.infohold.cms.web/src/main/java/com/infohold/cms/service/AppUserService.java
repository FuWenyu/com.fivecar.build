package com.infohold.cms.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.MD5Util;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.AppUserDao;
import com.infohold.cms.dao.VersionDao;
import com.infohold.cms.entity.OrganizationEntity;
import com.infohold.cms.entity.AppUserEntity;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.util.DateUtil;

/**
 * APP用户管理Service
 * @author wag
 *
 */
@SuppressWarnings("unchecked")
@Service("appUserService")
public class AppUserService implements IBusinessService {
	
	@Autowired
	private AppUserDao appuserdao;
	
	@Autowired
	private SysConfigUtil sysConfigUtil;
	
	private DateUtil dateutil = new DateUtil();
	
	private Logger logger = Logger.getLogger(AppUserService.class);
	
	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode=transData.getTradeCode();
		if(tradCode.equals("T40001")){
			return this.AppRegister(transData);
		}
		else if(tradCode.equals("T40002")){
			return this.loginCheck(transData);
		}
		return transData;	
	}
	/**
	 * APP用户注册
	 * @param transData
	 * @return
	 */
	public TransData AppRegister(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		logger.info("AppRegister-request:"+map);
		String phone_no = (String)map.get("phone_no");
		String password = (String)map.get("password");
		Timestamp create_date = dateutil.getTimestamp();
		
		AppUserEntity userentity = new AppUserEntity();
		userentity.setPhone(phone_no);
		userentity.setPassword(MD5Util.encryption(password));
		userentity.setCreate_date(create_date);
		if (!isPhoneNumber(phone_no)) {
			transData.setExpCode("-1");
			transData.setExpMsg("请输入正确的电话号！");
			return transData;
		}
		if (appuserdao.getbyphone(phone_no)) {
			transData.setExpCode("-1");
			transData.setExpMsg("此电话号码已经被注册过了！");
			return transData;
		}
		
		if (appuserdao.saveAppUserEntity(userentity)) {
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}else {
			
			transData.setExpCode("-1");
			transData.setExpMsg("此电话号码已经被注册过了！");
			return transData;
		}
		
		return transData;
		
	}
	//验证电话号，返回布尔值
	private boolean isPhoneNumber(String input){
		String regex="1([\\d]{10})|((\\+[0-9]{2,4})?\\(?[0-9]+\\)?-?)?[0-9]{7,8}";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(input);  
		return m.matches();
	}


	/**
	 * 登录验证
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData loginCheck(TransData transData) throws BusinessException{
		Map<String,Object> map= transData.getViewMap();
		logger.info("loginCheck-request:"+map);
		String login_name = (String)map.get("phone_no");
		String password = (String)map.get("password");
		String md5password = MD5Util.encryption(password);
		AppUserEntity user = appuserdao.loginCheck(login_name,md5password);
		if (user !=null) {
			transData.setExpCode("1");
			transData.setExpMsg("success");
			transData.setObj(user);
		}else {
			transData.setExpCode("-1");
			transData.setExpMsg("帐号或者密码错误！");
		}
		return transData;
	}
}
