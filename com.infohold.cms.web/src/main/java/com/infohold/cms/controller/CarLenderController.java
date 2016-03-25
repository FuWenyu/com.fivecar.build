package com.infohold.cms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.infohold.cms.basic.common.TransData;
import com.infohold.cms.basic.controller.CentreController;
import com.infohold.cms.entity.CarLenderEntity;;

/**
 * 车辆信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class CarLenderController extends CentreController{

	/**
	 * 金融机构列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/lender.do")
	public ModelAndView lenderIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("lenderService");
		transData.setTradeCode("T29001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> lenderList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("lenderList", lenderList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/sssscarlender/lender_getListInfo");
		}else{
			mav.setViewName("/sssscarlender/lender_getList");
		}
		return mav;
	}

	/**
	 * 4s店金融机构-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/lender_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("lenderService");
		transData.setTradeCode("T29002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> resourcesList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("resourcesList", resourcesList);
		mav.setViewName("/sssscarlender/lender_add");
		return mav;
	}

	/**
	 * 4s店金融机构-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/lender_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("lenderService");
		transData.setTradeCode("T29003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 4s店金融机构-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/lender_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("lenderService");
		transData.setTradeCode("T29004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 4s店金融机构-修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/lender_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("lenderService");
		transData.setTradeCode("T29005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		CarLenderEntity lender = (CarLenderEntity) transData.getObj();
		mav.addObject("lender",lender);
		transData.setServiceName("lenderService");
		transData.setTradeCode("T29002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> resourcesList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("resourcesList", resourcesList);
		mav.setViewName("/sssscarlender/lender_update");
		return mav;
	}
	
	/**
	 * 4s店金融机构-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/lender_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("lenderService");
		transData.setTradeCode("T29006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
