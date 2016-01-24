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
import com.infohold.cms.entity.CarSalesEntity;;

/**
 * 车辆信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class CarSalesController extends CentreController{

	/**
	 * 销售列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/sales.do")
	public ModelAndView salesIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("salesService");
		transData.setTradeCode("T25001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> salesList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("salesList", salesList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/sssscarsales/sales_getListInfo");
		}else{
			mav.setViewName("/sssscarsales/sales_getList");
		}
		return mav;
	}

	/**
	 * 4s店品牌-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/sales_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("salesService");
		transData.setTradeCode("T25002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> dealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("dealerList", dealerList);
		mav.setViewName("/sssscarsales/sales_add");
		return mav;
	}

	/**
	 * 4s店品牌-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/sales_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("salesService");
		transData.setTradeCode("T25003");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
	
	/**
	 * 4s店品牌-删除
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/sales_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("salesService");
		transData.setTradeCode("T25004");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 4s店品牌-修改界面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/sales_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("salesService");
		transData.setTradeCode("T25005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		CarSalesEntity sales = (CarSalesEntity) transData.getObj();
		mav.addObject("sales",sales);
		transData.setServiceName("salesService");
		transData.setTradeCode("T25002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> dealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("dealerList", dealerList);
		mav.setViewName("/sssscarsales/sales_update");
		return mav;
	}
	
	/**
	 * 4s店品牌-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/sales_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("salesService");
		transData.setTradeCode("T25006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
