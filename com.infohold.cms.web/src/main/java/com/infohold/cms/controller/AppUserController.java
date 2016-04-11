package com.infohold.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.VersionEntity;
import com.infohold.cms.service.BaseService;
import com.infohold.cms.service.AppUserService;
import com.infohold.cms.service.VersionService;

/**
 * APP用户注册登录模块
 * @author Administrator
 *
 */
@Controller
public class AppUserController extends CentreController{

	/**
	 * APP-注册
	 * 
	 * @param httpServletRequest
	 * @return map
	 */

	@RequestMapping("/app/register.do")
	@ResponseBody
	public Map<String, Object> register(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40001");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-登录
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/login.do")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40002");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			map.put("user", transData.getObj());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-修改密码
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/updatepwd.do")
	@ResponseBody
	public Map<String, Object> updatePWD(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40003");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-忘记密码验证码
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/updatepwdSMS.do")
	@ResponseBody
	public Map<String, Object> updatePWDforSMS(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40004");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-忘记密码手机找回
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/updatePWDforAS.do")
	@ResponseBody
	public Map<String, Object> updatePWDforU(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40005");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-客户信息补全
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/updateUser.do")
	@ResponseBody
	public Map<String, Object> updateUser(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40006");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-收藏图文
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/saveCollection.do")
	@ResponseBody
	public Map<String, Object> saveCollection(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40007");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			return map;
		}
		System.out.println(map);
		return map;
	}
	/**
	 * APP-查询图文
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/app/queryCollection.do")
	@ResponseBody
	public Map<String, Object> queryCollection(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletresponse) throws Exception {
		TransData transData = new TransData();
		transData.setServiceName("appUserService");
		transData.setTradeCode("T40008");
		transData=super.doService(httpServletRequest, transData);
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> collectionList  = (List<Map<String, Object>>)transData.getObj();
		if(!"".equals(transData.getExpCode())){
			map.put("expCode", transData.getExpCode());
			map.put("expMsg", transData.getExpMsg());
			map.put("collectionList", collectionList);
			return map;
		}
		System.out.println(map);
		return map;
	}
}
