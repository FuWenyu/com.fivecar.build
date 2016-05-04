package com.infohold.cms.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.exception.BusinessException;
import com.infohold.cms.basic.service.IBusinessService;
import com.infohold.cms.basic.util.FileUtil;
import com.infohold.cms.basic.util.MD5Util;
import com.infohold.cms.basic.util.SysConfigUtil;
import com.infohold.cms.dao.AppUserDao;
import com.infohold.cms.dao.ThirdPartyResourcesDao;
import com.infohold.cms.entity.AppUserEntity;
import com.infohold.cms.entity.CollectionEntity;
import com.infohold.cms.entity.ComplaintsEntity;
import com.infohold.cms.util.CustomPropertyUtil;
import com.infohold.cms.util.DateUtil;

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
	private ThirdPartyResourcesDao resourcesdao;
	@Autowired
	private SysConfigUtil sysConfigUtil;

	private DateUtil dateutil = new DateUtil();

	private static String resource_request = CustomPropertyUtil.getProperties("resource_request");
	private static String vehicle_request = CustomPropertyUtil.getProperties("vehicle_request");
	private static String pavehicle_request = CustomPropertyUtil.getProperties("pavehicle_request");
	private static String service_name = CustomPropertyUtil.getProperties("service_name");

	private Logger logger = Logger.getLogger(AppUserService.class);

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
			return this.saveCollection(transData);
		} else if (tradCode.equals("T40008")) {
			return this.queryCollection(transData);
		} else if (tradCode.equals("T40009")) {
			return this.queryArticle(transData);
		}else if (tradCode.equals("T40010")) {
			return this.complaints(transData);
		}else if (tradCode.equals("T40011")) {
			return this.uploadPicture(transData);
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
		// String code = (String) map.get("vccode");
		Timestamp create_date = dateutil.getTimestamp();
		/*
		 * String response = null; try { response = new SmsVerifyKit(appkey,
		 * phone_no, "86", code).go(); System.out.println(response);
		 * logger.info("AppRegister-SMSverifyresponse:" + response); } catch
		 * (Exception e) { e.printStackTrace(); }
		 */
		/*
		 * JSONObject responsejson = new JSONObject(response); int response1 =
		 * responsejson.getInt("status"); if (response1 == 200) {
		 */
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
			transData.setObj(map);
		} else {
			transData.setExpCode("-1");
			transData.setExpMsg("此电话号码已经被注册过了！");
			return transData;
		}
		/*
		 * } else { transData.setExpCode("-1"); transData.setExpMsg("验证码错误！"); }
		 */
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
		// String code = (String) map.get("vccode");
		String newpassword = (String) map.get("newpassword");
		/*
		 * String response = null; try { response = new SmsVerifyKit(appkey,
		 * phone_no, "86", code).go(); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */
		/*
		 * JSONObject responsejson = new JSONObject(response); int response1 =
		 * responsejson.getInt("status"); if (response1 == 200) {
		 */
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
				transData.setExpMsg("用户不存在！");
			}
		}
		/*
		 * } else { transData.setExpCode("-1"); transData.setExpMsg("验证码错误！"); }
		 */
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
		String profile_images = (String) map.get("profile_images");

		AppUserEntity user = appuserdao.getuserEntity(id);
		if (user != null) {
			user.setUser_name(user_name);
			user.setEmail(email);
			user.setSex(sex);
			user.setUser_addr(user_addr);
			user.setUser_ask1(user_ask);
			user.setUser_answer1(user_answer);
			user.setProfile_images(profile_images);
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
			if (user != null && user_answer.equals(user.getUser_answer1())) {
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
				transData.setExpMsg("密保答案错误！");
			}
		}
		return transData;
	}

	/**
	 * 收藏图文信息
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData saveCollection(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("saveCollection-request:" + map);
		String user_id = (String) map.get("user_id");
		String resource_id = (String) map.get("resource_id");
		String resource_type = (String) map.get("resource_type");
		String title = (String) map.get("title");
		String query_type = null;
		// if (resource_type.equals("normal") ||
		// resource_type.equals("thirdparty") || resource_type.equals("vehicle")
		// || resource_type.equals("pavehicle")) {
		/*
		 * if (resource_type.equals("normal") ||
		 * resource_type.equals("thirdparty")) { query_type = "article"; }else {
		 * query_type = "vehicle"; }
		 */
		String reCode = "1";
		StringBuffer anchor = new StringBuffer("");
		switch (resource_type) {
		case "normal":
			query_type = "article";
			// anchor.append(resource_request);
			anchor.append(resource_id);
			break;
		case "thirdparty":
			query_type = "article";
			anchor.append(resource_request);
			anchor.append(resource_id);
			break;
		case "vehicle":
			query_type = "vehicle";
			anchor.append(vehicle_request);
			anchor.append(resource_id);
			break;
		case "pavehicle":
			query_type = "vehicle";
			anchor.append(pavehicle_request);
			anchor.append(resource_id);
			break;
		default:
			reCode = "-1";
			transData.setExpCode("-1");
			transData.setExpMsg("收藏失败无效的类型！");
			break;
		}
		if (reCode.equals("1")) {
			CollectionEntity collection = new CollectionEntity();
			collection.setUser_id(user_id);
			collection.setResource_id(resource_id);
			collection.setUrl(anchor.toString());
			collection.setQuery_type(query_type);
			collection.setResource_type(resource_type);
			collection.setTitle(title);
			boolean iswork = appuserdao.saveCollectionEntity(collection);
			if (iswork) {
				transData.setExpCode("1");
				transData.setExpMsg("success");
			} else {
				transData.setExpCode("-1");
				transData.setExpMsg("收藏失败请重试！");
			}
		} else {
			transData.setExpCode("-1");
			transData.setExpMsg("收藏失败无效的类型！");
		}
		return transData;
	}

	/**
	 * 查询图文信息
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData queryCollection(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("queryCollection-request:" + map);
		String user_id = (String) map.get("user_id");
		String query_type = (String) map.get("query_type");
		List<Map<String, Object>> collectionList = appuserdao.queryCollectionEntity(user_id, query_type,
				transData.getPageInfo());
		if (!(collectionList == null)) {
			transData.setExpCode("1");
			transData.setExpMsg("success");
			transData.setObj(collectionList);
		} else {
			transData.setExpCode("1");
			transData.setExpMsg("亲！您的收藏夹是空的哦！");
		}
		return transData;
	}

	/**
	 * 图文信息查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData queryArticle(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("queryCollection-request:" + map);
		String title = (String) map.get("title");
		List<Map<String, Object>> orgList = resourcesdao.getResources(title,transData.getPageInfo());
		transData.setObj(orgList);
		transData.setExpCode("1");
		transData.setExpMsg("success");
		return transData;
	}
	/**
	 * 图文信息查询
	 * 
	 * @param transData
	 * @return
	 * @throws BusinessException
	 */
	public TransData complaints(TransData transData) throws BusinessException {
		Map<String, Object> map = transData.getViewMap();
		logger.info("queryCollection-request:" + map);
		String title = (String) map.get("title");
		String description = (String) map.get("description");
		ComplaintsEntity complaints = new ComplaintsEntity();
		complaints.setTitle(title);
		complaints.setDescription(description);
		Boolean res = resourcesdao.complaintsSave(complaints);
		if (res) {
			transData.setExpCode("1");
			transData.setExpMsg("success");
		}
		return transData;
	}
	/**
	 * 图片上传
	 * 
	 * @param transData
	 * @return
	 */
	public TransData uploadPicture(TransData transData) throws BusinessException {

		Map<String, Object> map = new HashMap<String, Object>();
		MultipartFile file = (MultipartFile) transData.getObj();
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		int id = sysConfigUtil.getPrimaryId();
		// 文件检查
		FileUtil.fileCheck(file);
		// 保存到本地
		String path = getClass().getResource("/").getPath();
		String filePath = path.substring(0, path.indexOf("/WEB-INF/")) + "/upload/userprofile";
		File file2 = new File(filePath, String.valueOf(id) + ext);
		InputStream in = null;
		try {
			in = file.getInputStream();
			FileUtils.copyInputStreamToFile(in, file2);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String url = service_name+ "/upload/userprofile/"+String.valueOf(id) + ext;
		map.put("url", url);
		transData.setViewMap(map);
		return transData;

	}
}