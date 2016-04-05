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
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.ThirdPartyResourcesEntity;

/**
 * 图文资源管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class ThirdPartyResourcesController extends CentreController{

	/**
	 * 跳转到主页面
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/tpresources.do")
	@ResponseBody
	public ModelAndView versionIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("tpresourcesService");
		transData.setTradeCode("T38001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> tpresourcesList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("tpresourcesList", tpresourcesList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/thirdpartyresources/resources_getListInfo");
		}else{
			mav.setViewName("/thirdpartyresources/resources_getList");
		}
		return mav;
	}
	/**
	 * 资源-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/tpresources_add.do")
	@ResponseBody
	public ModelAndView version_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("tpresourcesService");
		transData.setTradeCode("T38006");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("tpdealerList",transData.getObj());
		mav.setViewName("/thirdpartyresources/resources_add");
		return mav;
	}

	/**
	 * 资源新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/tpresources_addSave.do")
	@ResponseBody
	public Map<String,Object> versionadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpresourcesService");
		transData.setTradeCode("T38002");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	/**
	 * 资源-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/tpresources_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpresourcesService");
		transData.setTradeCode("T38003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 资源修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/tpresources_edit.do")
	@ResponseBody
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		ModelAndView mav = new ModelAndView();
		transData.setServiceName("tpresourcesService");
		transData.setTradeCode("T38006");
		transData=super.doService(httpServletRequest, transData);
		mav.addObject("tpdealerList",transData.getObj());
		transData.setTradeCode("T38004");
		transData=super.doService(httpServletRequest, transData);
		ThirdPartyResourcesEntity resource = (ThirdPartyResourcesEntity) transData.getObj();
		mav.addObject("resource",resource);
		mav.setViewName("/thirdpartyresources/resources_update");
		return mav;
	}
	
	/**
	 * 资源修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/tpresources_editSave.do")
	@ResponseBody
	public Map<String,Object> version_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("tpresourcesService");
		transData.setTradeCode("T38005");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}

}
