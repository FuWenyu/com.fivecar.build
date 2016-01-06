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
import com.infohold.cms.entity.CarDealerEntity;;

/**
 * 4s店信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class CarDealerController extends CentreController{

	/**
	 * 品牌列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/dealer.do")
	public ModelAndView dealerIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("dealerService");
		transData.setTradeCode("T24001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> dealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("dealerList", dealerList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/sssscardealer/dealer_getListInfo");
		}else{
			mav.setViewName("/sssscardealer/dealer_getList");
		}
		return mav;
	}

	/**
	 * 4s店信息-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/dealer_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("dealerService");
		transData.setTradeCode("T24002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> brandList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("brandList", brandList);
		mav.setViewName("/sssscardealer/dealer_add");
		return mav;
	}

	/**
	 * 4s店信息-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/dealer_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("dealerService");
		transData.setTradeCode("T24003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 4s店信息-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/dealer_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("dealerService");
		transData.setTradeCode("T24004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 4s店信息-修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/dealer_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("dealerService");
		transData.setTradeCode("T24005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		CarDealerEntity dealer = (CarDealerEntity) transData.getObj();
		mav.addObject("dealer",dealer);
		transData.setTradeCode("T24002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> brandList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("brandList", brandList);
		mav.setViewName("/sssscardealer/dealer_update");
		return mav;
	}
	
	/**
	 * 4s店信息-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/dealer_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("dealerService");
		transData.setTradeCode("T24006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
