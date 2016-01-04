package com.infohold.cms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.RoleEntity;

/**
 * 角色Controller
 * @author zhanghongchao
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class RoleController extends CentreController{

	/**
	 * 角色管理页面
	 * @param httpServletRequest
	 * @param page
	 * @return
	 */
	@RequestMapping("/mvc/role_getList.do")
	public ModelAndView role_getList(HttpServletRequest httpServletRequest,Page page) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<RoleEntity> roleList =(List<RoleEntity>) transData.getObj();
		mav.addObject("roleList", roleList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null)
			mav.setViewName("/authority/role/role_getListInfo");
		else
			mav.setViewName("/authority/role/role_getList");
		return mav;
	}
	
	/**
	 * 角色新增
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/role_add.do")
	public ModelAndView role_add(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50004");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		String role_code = (String) transData.getObj();
		mav.addObject("rolecode",role_code);
		mav.setViewName("/authority/role/role_add");
		return mav;
	}
	
	/**
	 * 角色新增提交
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/role_addSave.do")
	@ResponseBody
	public Map<String,Object> role_addSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50005");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 角色删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/role_delete.do")
	@ResponseBody
	public Map<String,Object> role_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50008");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 角色详细信息查询
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/role_edit.do")
	public ModelAndView role_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50006");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		Map<String,Object> roleEntity = (Map<String,Object>) transData.getObj();
		mav.addObject("roleEntity",roleEntity);
		mav.addObject("page",transData.getPageInfo());
		mav.setViewName("/authority/role/role_edit");
		return mav;
	}
	
	/**
	 * 角色编辑保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/role_editSave.do")
	@ResponseBody
	public Map<String,Object> role_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50007");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	/**
	 * 角色-角色菜单配置页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/role_editMenu.do")
	public ModelAndView role_editMenu(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50002");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = (Map<String, Object>) transData.getObj();
		mav.addObject("page",transData.getPageInfo());
		mav.addObject("roleEntity",(RoleEntity)map.get("roleEntity"));
		mav.addObject("menu_list",(List<Map<String, Object>>)map.get("menu_list"));
		mav.addObject("roleMenu",(List<Map<String, Object>>)map.get("roleMenu"));
		mav.setViewName("/authority/role/role_editMenu");
		return mav;
	}

	/**
	 * 角色-角色菜单功能配置保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/role_editMenuSave.do")
	@ResponseBody
	public Map<String,Object> role_editMenuSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("roleService");
		transData.setTradeCode("T50003");
		Map<String,Object> param_map = new HashMap<String,Object>();
		//多选框取值，需用Obj特殊处理
		param_map.put("ids", httpServletRequest.getParameterValues("ids"));
		transData.setObj(param_map);
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}

}
