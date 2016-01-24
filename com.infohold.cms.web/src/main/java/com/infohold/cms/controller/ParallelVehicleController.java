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
import com.infohold.cms.entity.CarVehicleEntity;
import com.infohold.cms.entity.ParallelVehicleEntity;;

/**
 * 车辆信息管理模块
 * @author Administrator
 *
 */
@SuppressWarnings("unchecked")
@Controller
public class ParallelVehicleController extends CentreController{

	/**
	 * 品牌列表
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/pavehicle.do")
	public ModelAndView vehicleIndex(HttpServletRequest httpServletRequest) throws JsonProcessingException {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32001");
		transData=super.doService(httpServletRequest, transData);
		String qry_type = (String)transData.getViewMap().get("qry_type");
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> vehicleList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("vehicleList", vehicleList);
		mav.addObject("page",transData.getPageInfo());
		if(qry_type!=null){
			mav.setViewName("/parallelcarvehicle/vehicle_getListInfo");
		}else{
			mav.setViewName("/parallelcarvehicle/vehicle_getList");
		}
		return mav;
	}

	/**
	 * 4s店品牌-新增页面
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/pavehicle_add.do")
	public ModelAndView picture_add(HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> brandList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("brandList", brandList);
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32009");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> priceList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("priceList", priceList);
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32010");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> vehicleversionList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("vehicleversionList", vehicleversionList);
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32011");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> dealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("dealerList", dealerList);
		mav.setViewName("/parallelcarvehicle/vehicle_add");
		return mav;
	}

	/**
	 * 4s店品牌-新增递交
	 * @param httpServletRequest
	 * @return ModelAndView
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/mvc/pavehicle_save.do")
	@ResponseBody
	public Map<String,Object> pictureadd(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32003");
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
	@RequestMapping("/mvc/pavehicle_delete.do")
	@ResponseBody
	public Map<String,Object> version_delete(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32004");
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
	@RequestMapping("/mvc/pavehicle_edit.do")
	public ModelAndView version_edit(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32005");
		transData=super.doService(httpServletRequest, transData);
		ModelAndView mav = new ModelAndView();
		ParallelVehicleEntity vehicle = (ParallelVehicleEntity) transData.getObj();
		mav.addObject("vehicle",vehicle);
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32002");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> brandList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("brandList", brandList);
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32009");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> priceList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("priceList", priceList);
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32010");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> vehicleversionList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("vehicleversionList", vehicleversionList);
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32011");
		transData=super.doService(httpServletRequest, transData);
		List<Map<String, Object>> dealerList = (List<Map<String, Object>>)transData.getObj();
		mav.addObject("dealerList", dealerList);
		mav.setViewName("/parallelcarvehicle/vehicle_update");
		return mav;
	}
	
	/**
	 * 4s店品牌-修改保存
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping("/mvc/pavehicle_editSave.do")
	@ResponseBody
	public Map<String,Object> picture_editSave(HttpServletRequest httpServletRequest) {
		TransData transData = new TransData();
		transData.setServiceName("pavehicleService");
		transData.setTradeCode("T32006");
		transData=super.doService(httpServletRequest, transData);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", transData.getExpMsg());
		return map;
	}
}
