package com.infohold.cms.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.MD5Util;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.AppUserDao;
import com.infohold.cms.entity.AppUserEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;
import com.infohold.cms.util.SmsVerifyKit;

/**
 * APP用户管理Service
 * 
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

	private static String appkey = CustomPropertyUtil.getProperties("appkey");

	@Override
	public TransData execute(TransData transData) throws BusinessException {
		String tradCode = transData.getTradeCode();
		if (tradCode.equals("T40001")) {
			return this.AppRegister(transData);
		} else if (tradCode.equals("T40002")) {
			return this.loginCheck(transData);
		} else if (tradCode.equals("T40003")) {
			return this.updatePWDforpwd(transData);
		} else if (tradCode.equals("T40004")) {
			return this.updatePWDforSMS(transData);
		} else if (tradCode.equals("T40005")) {
			return this.updatePWDforAnswer(transData);
		} else if (tradCode.equals("T40006")) {
			return this.updateUser(transData);
		} else if (tradCode.equals("T40007")) {
			return this.loginCheck(transData);
		} else if (tradCode.equals("T40008")) {
			return this.loginCheck(transData);
		}
		return transData;
	}

	/**
	 * APP用户注册
	 * 
	 * @param transData
	 * @return
	 */
	public TransData AppRegister(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("AppRegister-request:" + map);
		String phone_no = (String) map.get("phone_no");
		String password = (String) map.get("password");
		String code = (String) map.get("code");
		Timestamp create_date = dateutil.getTimestamp();
		String response = null;
		try {
			response = new SmsVerifyKit(appkey, phone_no, "86", code).go();
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject responsejson = new JSONObject(response);
		int response1 = responsejson.getInt("status");
		if (response1 == 200) {
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
			} else {
				transData.setExpCode("-1");
				transData.setExpMsg("此电话号码已经被注册过了！");
				return transData;
			}
		} else {
			transData.setExpCode("-1");
			transData.setExpMsg("验证码错误！");
		}
		return transData;

	}

	// 验证电话号，返回布尔值
	private boolean isPhoneNumber(String input) {
		String regex = "1([\\d]{10})|((\\+[0-9]{2,4})?\\(?[0-9]+\\)?-?)?[0-9]{7,8}";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(input);
		return m.matches();
	}

	/**
	 * 登录验证
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData loginCheck(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("loginCheck-request:" + map);
		String phone_no = (String) map.get("phone_no");
		String password = (String) map.get("password");
		String md5password = MD5Util.encryption(password);
		AppUserEntity user = appuserdao.loginCheck(phone_no, md5password);
		if (user != null) {
			transData.setExpCode("1");
			transData.setExpMsg("success");
			transData.setObj(user);
		} else {
			transData.setExpCode("-1");
			transData.setExpMsg("帐号或者密码错误！");
		}
		return transData;
	}

	/**
	 * 通过密码修改密码
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updatePWDforpwd(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("updatePWDforpwd-request:" + map);
		String phone_no = (String) map.get("phone_no");
		String password = (String) map.get("password");
		String newpassword = (String) map.get("newpassword");
		String md5password = MD5Util.encryption(password);
		String newmd5pwd = MD5Util.encryption(newpassword);
		AppUserEntity user = appuserdao.loginCheck(phone_no, md5password);
		if (user != null) {
			AppUserEntity newuser = appuserdao.getuserEntity(user.getId());
			newuser.setPassword(newmd5pwd);
			if (appuserdao.user_update(newuser)) {
				transData.setExpCode("1");
				transData.setExpMsg("success");
			} else {
				transData.setExpCode("-1");
				transData.setExpMsg("更新失败请重试！");
			}
		} else {
			transData.setExpCode("-1");
			transData.setExpMsg("帐号或者密码错误！");
		}
		return transData;
	}

	/**
	 * 通过验证码修改密码
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updatePWDforSMS(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("updatePWDforSMS-request:" + map);
		String phone_no = (String) map.get("phone_no");
		String code = (String) map.get("code");
		String newpassword = (String) map.get("newpassword");
		String response = null;
		try {
			response = new SmsVerifyKit(appkey, phone_no, "86", code).go();
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject responsejson = new JSONObject(response);
		int response1 = responsejson.getInt("status");
		if (response1 == 200) {
			String newmd5pwd = MD5Util.encryption(newpassword);
			String id = appuserdao.getuserbyphone(phone_no);
			if (id == null) {
				transData.setExpCode("-1");
				transData.setExpMsg("用户不存在！");
			} else {
				AppUserEntity user = appuserdao.getuserEntity(id);
				if (user != null) {
					user.setPassword(newmd5pwd);
					if (appuserdao.user_update(user)) {
						transData.setExpCode("1");
						transData.setExpMsg("success");
					} else {
						transData.setExpCode("-1");
						transData.setExpMsg("更新失败请重试！");
					}
				} else {
					transData.setExpCode("-1");
					transData.setExpMsg("帐号或者密码错误！");
				}
			}
		} else {
			transData.setExpCode("-1");
			transData.setExpMsg("验证码错误！");
		}
		return transData;
	}

	/**
	 * 用户信息补全
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updateUser(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("updateUser-request:" + map);
		String id = (String) map.get("id");
		String user_name = (String) map.get("user_name");
		String email = (String) map.get("email");
		String sex = (String) map.get("sex");
		String user_addr = (String) map.get("user_addr");
		String user_ask = (String) map.get("user_ask");
		String user_answer = (String) map.get("user_answer");

		AppUserEntity user = appuserdao.getuserEntity(id);
		if (user != null) {
			user.setUser_name(user_name);
			user.setEmail(email);
			user.setSex(sex);
			user.setUser_addr(user_addr);
			user.setUser_ask1(user_ask);
			user.setUser_answer1(user_answer);
			if (appuserdao.user_update(user)) {
				transData.setExpCode("1");
				transData.setExpMsg("success");
			} else {
				transData.setExpCode("-1");
				transData.setExpMsg("更新失败请重试！");
			}
		} else {
			transData.setExpCode("-1");
			transData.setExpMsg("用户不存在！");
		}
		return transData;
	}

	/**
	 * 通过密保问题修改密码
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData updatePWDforAnswer(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("updatePWDforAnswer-request:" + map);
		String phone_no = (String) map.get("phone_no");
		String user_answer = (String) map.get("user_answer");
		String newpassword = (String) map.get("newpassword");
		String newmd5pwd = MD5Util.encryption(newpassword);
		String id = appuserdao.getuserbyphone(phone_no);
		if (id == null) {
			transData.setExpCode("-1");
			transData.setExpMsg("用户不存在！");
		} else {
			AppUserEntity user = appuserdao.getuserEntity(id);
			if (user != null&&user_answer.equals(user.getUser_answer1())) {
				user.setPassword(newmd5pwd);
				if (appuserdao.user_update(user)) {
					transData.setExpCode("1");
					transData.setExpMsg("success");
				} else {
					transData.setExpCode("-1");
					transData.setExpMsg("更新失败请重试！");
				}
			}else {
				transData.setExpCode("-1");
				transData.setExpMsg("密保答案错误！");
			}
		}
		return transData;
	}
}
