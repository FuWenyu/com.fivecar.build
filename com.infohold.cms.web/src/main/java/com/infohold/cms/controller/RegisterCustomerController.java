package com.infohold.cms.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.common.UserSession;
import com.infohold.cms.basic.constant.SysErrorCodeDef;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.MenuEntity;
import com.infohold.cms.service.MenuService;

/**
 * 注册模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class RegisterCustomerController extends CentreController{

	@Autowired
	private MenuService menuService;

	/**
	 * 登录
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/mvc/logintest.do")
	@ResponseBody
	public Map<String,Object> login(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		Map<String,Object> map = new  HashMap<String,Object>();
		//查询用户信息
		transData.setServiceName("loginService");
		transData=super.doService(httpServletRequest, transData);
		if("E002".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E002").cnname());
			return map;
		}
		//用户已登录错误信息
		else if("E017".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E017").cnname());
			return map;
		}
		//用户已停用信息
		else if("E018".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E018").cnname());
			return map;
		}
		UserSession userSession= transData.getUserSession();
		httpServletRequest.getSession().setAttribute("userSession",userSession);
		return map;
	}
	/**
	 * 用户注册
	 * 
	 * @param httpServletRequest
	 * @return map
	 */
	@RequestMapping("/register.do")
	@ResponseBody
	public Map<String,Object> register(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		Map<String,Object> map = new  HashMap<String,Object>();
		//查询用户信息
		transData.setServiceName("loginService");
		transData=super.doService(httpServletRequest, transData);
		if("E002".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E002").cnname());
			return map;
		}
		//用户已登录错误信息
		else if("E017".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E017").cnname());
			return map;
		}
		//用户已停用信息
		else if("E018".equals(transData.getExpCode())){
			map.put("expMsg", SysErrorCodeDef.valueOf("E018").cnname());
			return map;
		}
		UserSession userSession= transData.getUserSession();
		httpServletRequest.getSession().setAttribute("userSession",userSession);
		return map;
	}
}
