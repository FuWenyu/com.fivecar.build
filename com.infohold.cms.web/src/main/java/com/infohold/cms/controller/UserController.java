package com.infohold.cms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.Label;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.UserEntity;
import com.infohold.cms.entity.UserRoleEntity;

/**
 * 用户Controller
 * @author wanglei
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class UserController extends CentreController{

	/**
	 * 用户管理页面
	 * @param httpServletRequest
	 * @param page
	 * @return
	 */
	@RequestMapping("/mvc/user_getList.do")
	public ModelAndView user_getList(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50011");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<UserEntity> userList =(List<UserEntity>) transData.getObj();
		mav.addObject("userList", userList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/authority/user/user_getListInfo");
		}else{
			mav.setViewName("/authority/user/user_getList");
		}
		return mav;
	}

	/**
	 * 用户-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_add.do")
	public ModelAndView user_add(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50012");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		Map<String,List<Label>> map =  (Map<String, List<Label>>) transData.getObj();
		mav.addObject("cmsRoleList",(List<Label>)map.get("cmsRoleList"));
		mav.addObject("guaranteeList",(List<Label>)map.get("guaranteeList"));
		mav.setViewName("/authority/user/user_add");
		return mav;
	}

	/**
	 * 用户-新增保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_addSave.do")
	@ResponseBody
	public Map<String,Object> user_addSave(HttpServletRequest httpServletRequest){
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50013");
		Map<String,Object> param_map = new HashMap<String,Object>();
		//多选框取值，需用Obj特殊处理
		param_map.put("cms_roleid", httpServletRequest.getParameterValues("cms_roleid"));
		param_map.put("oms_roleid", httpServletRequest.getParameterValues("oms_roleid"));
		transData.setObj(param_map);
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}

	/**
	 * 用户-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_delete.do")
	@ResponseBody
	public Map<String,Object> user_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50014");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 用户编辑页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_edit.do")
	public ModelAndView user_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50015");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map =  (Map<String, Object>) transData.getObj();
		mav.addObject("userEntity",(UserEntity)map.get("userEntity"));
		mav.addObject("user_roleList",(List<UserRoleEntity>)map.get("user_roleList"));
		if("oms".equals(transData.getViewMap().get("type"))){
			mav.addObject("omsRoleList",(List<Label>)map.get("omsRoleList"));
			mav.addObject("organizationList",(List<Label>)map.get("organizationList"));
			mav.setViewName("/authority/user_oms/user_edit");
		}else{
			mav.addObject("cmsRoleList",(List<Label>)map.get("cmsRoleList"));
			mav.addObject("guaranteeList",(List<Label>)map.get("guaranteeList"));
			mav.setViewName("/authority/user/user_edit");
		}
		return mav;
	}
	
	/**
	 * 用户查看页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_view.do")
	public ModelAndView user_view(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50015");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map =  (Map<String, Object>) transData.getObj();
		mav.addObject("userEntity",(UserEntity)map.get("userEntity"));
		mav.addObject("user_roleList",(List<UserRoleEntity>)map.get("user_roleList"));
		mav.addObject("cmsRoleList",(List<Label>)map.get("cmsRoleList"));
		mav.addObject("guaranteeList",(List<Label>)map.get("guaranteeList"));
		mav.setViewName("/authority/user/user_view");
		return mav;
	}

	/**
	 * 用户-编辑保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_editSave.do")
	@ResponseBody
	public Map<String,Object> user_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50017");
		Map<String,Object> param_map = new HashMap<String,Object>();
		//多选框取值，需用Obj特殊处理
		param_map.put("cms_roleid", httpServletRequest.getParameterValues("cms_roleid"));
		param_map.put("oms_roleid", httpServletRequest.getParameterValues("oms_roleid"));
		transData.setObj(param_map);
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 用户-密码重置
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_resetPwd.do")
	@ResponseBody
	public Map<String,Object> user_resetPwd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50018");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 用户-置离线状态
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_setOffline.do")
	@ResponseBody
	public Map<String,Object> user_setOffline(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50019");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 用户修改密码页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_editPwd.do")
	public ModelAndView user_editPwd(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/authority/user_editPwd");
		return mav;
	}
	
	/**
	 * 用户-修改密码保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/user_editPwdSave.do")
	@ResponseBody
	public Map<String,Object> user_editPwdSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("userService");
		transData.setTradeCode("T50020");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}

}
